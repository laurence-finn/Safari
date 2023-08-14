//File: SubmitAnimal.cshtml.cs
//Class: SubmitAnimalPageModel
//Description: This is the code-behind class for the Submit Animal page, which allows users to submit animals to the database.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Safari.Data;
using System.ComponentModel.DataAnnotations;

namespace Safari.Web.Pages;

public class SubmitAnimalPageModel : PageModel
{
    private readonly WildlifeDataContext _context;
    private readonly IWildlifeRepository _repository;

    //Constructor
    public SubmitAnimalPageModel(WildlifeDataContext context, IWildlifeRepository repository)
    {
        _context = context;
        _repository = repository;
    }

    [BindProperty]
    public Animal Animal { get; set; } = default!;

    [BindProperty]
    [Required(ErrorMessage = "Please select at least one state.")]
    public List<int> SelectedStateIds { get; set; } = default!;

    [BindProperty]
    public AnimalDescription AnimalDescription { get; set; } = default!;

    [BindProperty]
    public AnimalPic AnimalPic { get; set; } = default!;

    //RepopulateViewData: Repopulates the view data for the dropdown lists
    public void RepopulateViewData()
    {
        ViewData["AnimalTypeId"] = new SelectList(
                           _context.AnimalType, "AnimalTypeId", "Name");
        ViewData["DietTypeId"] = new SelectList(
                           _context.DietType, "DietTypeId", "Name");
        ViewData["StateId"] = new SelectList(
                           _context.State, "StateId", "Name");
    }

    //OnGet: On HTTP GET, populate the view data and return the page
    public IActionResult OnGet()
    {
        RepopulateViewData();
        return Page();
    }

    //OnPostResetForm: On HTTP POST, if the user clicks the "Reset Form" button, reset the form and return the page
    public IActionResult OnPostResetForm()
    {
        // Reset the model properties to their default values
        Animal = new Animal();
        SelectedStateIds = new List<int>();
        AnimalDescription = new AnimalDescription();
        AnimalPic = new AnimalPic();

        // Clear model state errors
        ModelState.Clear();

        // Repopulate the view and return to the page
        RepopulateViewData();
        return Page();
    }

    //OnPostAsync: On HTTP POST, if the user clicks the "Submit" button, try to submit the animal to the database.
    public async Task<IActionResult> OnPostAsync()
    {
        // If the model state is invalid for any other reason, cancel the post
        if (!ModelState.IsValid)
        {
            RepopulateViewData();
            return Page();
        }

        //Create a variable to store the new animal's ID. This ID is set after adding a record to the Animal table,
        //and is used when adding records to the AnimalState, AnimalDescription, and AnimalPic tables.
        int NewAnimalID = 0;

        //Begin transaction
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            // Execute the insert_animal stored procedure
            NewAnimalID = await _repository.AddAnimalAsync(Animal);

            //Execute the insert_animalstate stored procedure
            foreach (var StateID in SelectedStateIds)
            {
                await _repository.AddAnimalStateAsync(NewAnimalID, StateID);
            }

            // If the description is null, set it to "No description provided."
            if (AnimalDescription.Description == null)
            {
                AnimalDescription.Description = "No description provided.";
            }
            await _repository.AddAnimalDescriptionAsync(NewAnimalID, AnimalDescription);

            if (AnimalPic.File != null)
            {
                // Generate a unique file name for the uploaded image
                // Format is AnimalID + "_" + Name + "_1" + extension,
                // where 1 indicates the number of images. Since this is the first image, the number is 1.
                // This is stored in the database.
                AnimalPic.FileName = $"{NewAnimalID}_{Animal.Name}_1{Path.GetExtension(AnimalPic.File.FileName)}";

                // Set the file path to the "images" folder in the wwwroot directory
                // This is stored in the database.
                AnimalPic.FilePath = Path.Combine("images", AnimalPic.FileName);

                // Save the uploaded file to the images folder.
                var FullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", AnimalPic.FilePath);
                using (var FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    await AnimalPic.File.CopyToAsync(FileStream);
                }

                // Save the AnimalPic object to the database
                await _repository.AddAnimalPicAsync(NewAnimalID, AnimalPic);
            }

            ModelState.Clear();
            //Commit the transaction
            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal submitted successfully!";
            RepopulateViewData();
            return Page();
        }
        //Catch any SQL exceptions: rollback the transaction and display an error message on the Submit page.
        catch (SqlException ex)
        {
            TempData["ErrorMessage"] = ex.Message;
            //Rollback the transaction
            await transaction.RollbackAsync();
            RepopulateViewData();
            return Page();
        }
    }
}
