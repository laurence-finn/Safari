//File: SubmitImage.cshtml.cs
//Class: SubmitImagePageModel
//Description: This is the code-behind class for the Submit Image page, which allows users to submit images to the database.

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Safari.Data;

namespace Safari.Web.Pages;

public class SubmitImagePageModel : PageModel
{
    private readonly WildlifeDataContext _context;
    private readonly IWildlifeRepository _repository;

    //Constructor
    public SubmitImagePageModel(WildlifeDataContext context, IWildlifeRepository repository)
    {
        _context = context;
        _repository = repository;
    }

    [BindProperty]
    public AnimalPic AnimalPic { get; set; } = default!;

    //RepopulateViewData: Fills the Animal drop-down with the list of animals in the database
    public void RepopulateViewData()
    {
        ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
    }

    //OnGet: On HTTP GET, populate the view data and return the page.
    public IActionResult OnGet()
    {
        RepopulateViewData();
        return Page();
    }

    //OnPostResetForm: On HTTP POST, if the user clicks the "Reset Form" button, reset the form and return the page.
    public IActionResult OnPostResetForm()
    {
        // Reset the model properties to their default values
        AnimalPic = new AnimalPic();

        // Clear model state errors
        ModelState.Clear();

        // Repopulate the view and return to the page
        RepopulateViewData();
        return Page();
    }

    //OnPostAsync: On HTTP POST, if the user clicks the "Submit" button, validate the form and save the data to the database.
    public async Task<IActionResult> OnPostAsync()
    {
        //If the submitted information is invalid for any reason, return to the page.
        if (!ModelState.IsValid)
        {
            RepopulateViewData();
            return Page();
        }

        //Begin transaction
        using var transaction = await _context.Database.BeginTransactionAsync();

        //Try to add the image to the database and save the file to the images folder.
        try
        {
            if (AnimalPic.File != null)
            {
                //Get the animal name based on the animal ID the user selected
                var AnimalName = _context.Animal.Where(a => a.AnimalId == AnimalPic.AnimalId).Select(a => a.Name).FirstOrDefault();

                //if the name comes up empty, return an error
                if (string.IsNullOrEmpty(AnimalName))
                {
                    TempData["ErrorMessage"] = "Animal not found.";
                    await transaction.RollbackAsync();
                    RepopulateViewData();
                    return Page();
                }

                // Get the count of images for this animal currently in the database
                var ImageCount = _context.AnimalPic.Where(a => a.AnimalId == AnimalPic.AnimalId).Count();
                ImageCount++;

                // Generate a unique file name for the uploaded image
                // Format is AnimalID + "_" + Name + "_#" + extension, where # is the image number.
                // This is stored in the database.
                AnimalPic.FileName = $"{AnimalPic.AnimalId}_{AnimalName}_{ImageCount}{Path.GetExtension(AnimalPic.File.FileName)}";

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
                await _repository.AddAnimalPicAsync(AnimalPic.AnimalId, AnimalPic);

                ModelState.Clear();
                //Commit the transaction
                await transaction.CommitAsync();
                TempData["SuccessMessage"] = "Image submitted successfully!";
                RepopulateViewData();
                return Page();
            }
            //If the file is null for any reason, return an error.
            else
            {
                TempData["ErrorMessage"] = "No file selected.";
                await transaction.RollbackAsync();
                RepopulateViewData();
                return Page();
            }
        }
        //Catch any SQL exceptions, return an error, and rollback the transaction.
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
