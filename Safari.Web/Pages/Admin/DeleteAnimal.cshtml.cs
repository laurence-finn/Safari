//File: DeleteAnimal.cshtml.cs
//Class: DeleteAnimalPageModel
//Description: The code-behind class for the Delete Animal page. Deletes an animal from the database.

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
    //Only users with the Admin role can access this page.
    [Authorize]
    public class DeleteAnimalPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        //Constructor
        public DeleteAnimalPageModel(WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public Animal Animal { get; set; } = default!;

        //OnGetAsync: On HTTP GET, gets the animal to be deleted from the database so it can be displayed on the page.
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            //Get the animal to be deleted from the database by using the AnimalId passed in.
            var animal = await _context.Animal.FirstOrDefaultAsync(m => m.AnimalId == id);

            if (animal == null)
            {
                return NotFound();
            }
            else
            {
                Animal = animal;
            }
            return Page();
        }

        //OnPostAsync: On HTTP POST, deletes the animal from the database.
        public async Task<IActionResult> OnPostAsync(int? id)
        {
            //If the Animal does not exist, return a 404 error.
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            //Begin transaction
            var transaction = await _context.Database.BeginTransactionAsync();

            //Try to delete the animal from the database.
            try
            {
                await _repository.DeleteAnimalAsync(Animal.AnimalId);
            }
            //Catch any SQL exceptions and rollback the transaction.
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                //Rollback transaction
                await transaction.RollbackAsync();
            }

            //Commit transaction
            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal deleted successfully!";
            return RedirectToPage("./AdminAnimals");
        }
    }
}
