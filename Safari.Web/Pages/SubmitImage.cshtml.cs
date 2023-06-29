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

    public SubmitImagePageModel(WildlifeDataContext context, IWildlifeRepository repository)
    {
        _context = context;
        _repository = repository;
    }

    [BindProperty]
    public AnimalPic AnimalPic { get; set; } = default!;

    public void RepopulateViewData()
    {
        ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
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
        if (!ModelState.IsValid)
        {
            RepopulateViewData();
            return Page();
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

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
                // In the future, I will add a moderation queue to approve images first.
                var FullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", AnimalPic.FilePath);
                using (var FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    await AnimalPic.File.CopyToAsync(FileStream);
                }

                // Save the AnimalPic object to the database
                await _repository.AddAnimalPicAsync(AnimalPic.AnimalId, AnimalPic);

                ModelState.Clear();
                await transaction.CommitAsync();
                TempData["SuccessMessage"] = "Image submitted successfully!";
                RepopulateViewData();
                return Page();
            }
            else
            {
                TempData["ErrorMessage"] = "No file selected.";
                await transaction.RollbackAsync();
                RepopulateViewData();
                return Page();
            }
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
