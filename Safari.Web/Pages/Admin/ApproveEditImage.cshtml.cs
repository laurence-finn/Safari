//File: ApproveEditImage.cshtml.cs
//Class: ApproveEditImagePageModel
//Description: This is the code-behind class for the ApproveEditImage.cshtml page.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Safari.Data;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class ApproveEditImagePageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        //Constructor
        public ApproveEditImagePageModel(WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;

        //*************
        //Reusable Code
        //*************
        //RepopulateViewDataAsync: This method repopulates the ViewData for the page whenever the page is refreshed/loaded.
        //Instead of copying this code into every GET and POST method, it is placed here and called whenever needed,
        //reducing the amount of code needed.
        private async Task<IActionResult> RepopulateViewDataAsync(int? id)
        {
            var animalpic = await _context.AnimalPic.FirstOrDefaultAsync(m => m.AnimalPicId == id);
            if (animalpic == null)
            {
                return NotFound();
            }
            AnimalPic = animalpic;
            //Show a list of all animals in the database, so that the user can select the animal that the image belongs to.
            //If needed, this may be changed in the future to limit the list to only animals that have been approved.
            ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
            return Page();
        }

        //OnGetAsync: On HTTP GET, call RepopulateViewDataAsync to populate the viewdata for the page.
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            //If the selected AnimalPic id does not exist, return a 404 error.
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            await RepopulateViewDataAsync(id);
            return Page();
        }

        //OnPostAsync: On HTTP POST, if the model state is valid, update the AnimalPic in the database.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
                return Page();
            }

            //Begin transaction
            using var transaction = await _context.Database.BeginTransactionAsync();

            //Try to update the AnimalPic in the database.
            try
            {
                await _repository.UpdateAnimalPicAsync(AnimalPic);
            }
            //Catch any SQL exceptions that occur and display the error message to the user.
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                //Rollback transaction
                await transaction.RollbackAsync();
                await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
                return Page();
            }

            //Commit transaction
            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal image updated successfully!";
            await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
            return Page();
        }
    }
}
