//File: DeleteImage.cshtml.cs
//Class: DeleteImagePageModel
//Description: The code-behind class for the Delete Image page. Deletes an image from the database and from the webroot images folder.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class DeleteImagePageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        //Constructor
        public DeleteImagePageModel(Safari.Data.WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;

        //OnGetAsync: On HTTP GET, gets the image to be deleted from the database so its details can be displayed on the page.
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            var animalpic = await _context.AnimalPic.FirstOrDefaultAsync(m => m.AnimalPicId == id);

            if (animalpic == null)
            {
                return NotFound();
            }
            else
            {
                AnimalPic = animalpic;
            }
            return Page();
        }

        //OnPostAsync: On HTTP POST, deletes the image from the database and from the webroot images folder.
        public async Task<IActionResult> OnPostAsync(int? id)
        {
            //If the Animal image does not exist, return a 404 error.
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            //Begin transaction
            using var transaction = await _context.Database.BeginTransactionAsync();

            //Try to delete the image from the database and from the webroot images folder.
            try
            {
                //delete the image from webroot
                var imagePath = System.IO.Path.Combine("wwwroot", "images", AnimalPic.FileName);
                System.IO.File.Delete(imagePath);
                await _repository.DeleteAnimalPicAsync(AnimalPic);
                //Commit transaction
                await transaction.CommitAsync();
                TempData["SuccessMessage"] = "Animal image deleted successfully!";
            }
            //Catch any SQL exceptions and rollback the transaction.
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                await transaction.RollbackAsync();
            }
            //Catch any other exceptions (such as IO exceptions when deleting the image from the webroot) and rollback the transaction.
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "There was an error deleting the image from the website: " + ex.Message;
                await transaction.RollbackAsync();
            }

            return RedirectToPage("./AdminImages");
        }
    }
}
