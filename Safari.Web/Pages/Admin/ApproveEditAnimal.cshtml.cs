//File: ApproveEditAnimal.cshtml.cs
//Class: ApproveEditAnimalPageModel
//Description: This is the code-behind class for the ApproveEditAnimal.cshtml page.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    public class ApproveEditAnimalPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        //Constructor
        public ApproveEditAnimalPageModel(WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public Animal Animal { get; set; } = default!;

        [BindProperty]
        public AnimalDescription AnimalDescription { get; set; } = default!;

        //This list contains all the states that the animal is in.
        [BindProperty]
        public List<int> SelectedStateIds { get; set; } = new List<int>();

        //RepopulateViewDataAsync: This method repopulates the ViewData for the page whenever the page is refreshed/loaded.
        private async Task<IActionResult> RepopulateViewDataAsync(int? id)
        {
            var animal = await _context.Animal.FirstOrDefaultAsync(m => m.AnimalId == id);
            if (animal == null)
            {
                return NotFound();
            }
            //Populate the Animal, AnimalDescription, AnimalType, and DietType ViewData for the page.
            Animal = animal;
            ViewData["AnimalTypeId"] = new SelectList(
                               _context.AnimalType, "AnimalTypeId", "Name");
            ViewData["DietTypeId"] = new SelectList(
                               _context.DietType, "DietTypeId", "Name");

            var animalDescription = await _context.AnimalDescription.FirstOrDefaultAsync(m => m.AnimalId == id);
            if (animalDescription == null)
            {
                return NotFound();
            }
            AnimalDescription = animalDescription;

            //Fill the SelectedStateIds list with the states that the animal is in.
            SelectedStateIds = await _context.AnimalState
                .Where(a => a.AnimalId == id)
                .Select(a => a.StateId)
                .ToListAsync();

            //Fill the state multi-selector with a list of all states in the database.
            var states = await _context.State.ToListAsync();
            ViewData["StateId"] = new SelectList(states, "StateId", "Name");

            return Page();
        }

        //OnGetAsync: On HTTP GET, call RepopulateViewDataAsync to populate the viewdata for the page.
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            //If the selected animal id does not exist, return a 404 error.
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            await RepopulateViewDataAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            //If the model is invalid for any reason, refresh the page with an error message.
            if (!ModelState.IsValid)
            {
                await RepopulateViewDataAsync(Animal.AnimalId);
                TempData["ErrorMessage"] = "Invalid model.";
                return Page();
            }

            //Begin transaction
            using var transaction = await _context.Database.BeginTransactionAsync();

            //Try to update the Animal and AnimalDescription tables in the database, then delete all previous AnimalState entries for the animal,
            //and add new AnimalState entries for the animal.
            try
            {
                await _repository.UpdateAnimalAsync(Animal);
                await _repository.UpdateAnimalDescriptionAsync(AnimalDescription);
                await _repository.DeleteAllAnimalStateAsync(Animal.AnimalId);
                foreach (var StateID in SelectedStateIds)
                {
                    await _repository.AddAnimalStateAsync(Animal.AnimalId, StateID);
                }
            }
            //Catch SQL exceptions and refresh the page with an error message.
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                //Rollback transaction
                await transaction.RollbackAsync();
                await RepopulateViewDataAsync(Animal.AnimalId);
                return Page();
            }

            //Commit transaction
            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal updated successfully!";
            await RepopulateViewDataAsync(Animal.AnimalId);
            return Page();
        }
    }
}
