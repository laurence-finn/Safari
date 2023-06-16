using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Safari.Data;

namespace Safari.Web.Pages;

public class SubmitAnimalPageModel : PageModel
{
    private readonly WildlifeDataContext _context;
    private readonly IWildlifeRepository _repository;

    public SubmitAnimalPageModel(WildlifeDataContext context, IWildlifeRepository repository)
    {
        _context = context;
        _repository = repository;
    }

    [BindProperty]
    public Animal Animal { get; set; } = default!;

    [BindProperty]
    public List<int> SelectedStateIds { get; set; } = default!;

    [BindProperty]
    public AnimalDescription AnimalDescription { get; set; } = default!;

    [BindProperty]
    public AnimalPic AnimalPic { get; set; } = default!;

    public void RepopulateViewData()
    {
        ViewData["AnimalTypeId"] = new SelectList(
                           _context.AnimalType, "AnimalTypeId", "Name");
        ViewData["DietTypeId"] = new SelectList(
                           _context.DietType, "DietTypeId", "Name");
        ViewData["StateId"] = new SelectList(
                           _context.State, "StateId", "Name");
    }

    public IActionResult OnGet()
    {
        RepopulateViewData();
        return Page();
    }

    public IActionResult OnPostResetForm()
    {
        RepopulateViewData();
        return Page();
    }

    public async Task<IActionResult> OnPostAsync()
    {
        // If the model state is invalid for any other reason, cancel the post
        if (!ModelState.IsValid)
        {
            RepopulateViewData();
            return Page();
        }

        int NewAnimalID = 0;

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

            //Execute the insert_animaldescription stored procedure
            if (!string.IsNullOrEmpty(AnimalDescription.Description))
            {
                await _repository.AddAnimalDescriptionAsync(NewAnimalID, AnimalDescription);
            }

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
                // In the future, I will add a moderation queue to approve images first.
                var FullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", AnimalPic.FilePath);
                using (var FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    await AnimalPic.File.CopyToAsync(FileStream);
                }

                // Save the AnimalPic object to the database
                await _repository.AddAnimalPicAsync(NewAnimalID, AnimalPic);
            }

            ModelState.Clear();
            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal submitted successfully!";
            RepopulateViewData();
            return Page();
        }
        catch (SqlException ex)
        {
            TempData["ErrorMessage"] = ex.Message;
            await transaction.RollbackAsync();
            RepopulateViewData();
            return Page();
        }
    }
}
