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
    public class EditModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        public EditModel(WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public Animal Animal { get; set; } = default!;

        [BindProperty]
        public AnimalDescription AnimalDescription { get; set; } = default!;

        [BindProperty]
        public List<int> SelectedStateIds { get; set; } = new List<int>();

        private async Task<IActionResult> RepopulateViewDataAsync(int? id)
        {
            var animal = await _context.Animal.FirstOrDefaultAsync(m => m.AnimalId == id);
            if (animal == null)
            {
                return NotFound();
            }
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

            SelectedStateIds = await _context.AnimalState
                .Where(a => a.AnimalId == id)
                .Select(a => a.StateId)
                .ToListAsync();

            var states = await _context.State.ToListAsync();
            ViewData["StateId"] = new SelectList(states, "StateId", "Name");

            return Page();
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            await RepopulateViewDataAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                await RepopulateViewDataAsync(Animal.AnimalId);
                TempData["ErrorMessage"] = "Invalid model.";
                return Page();
            }

            using var transaction = await _context.Database.BeginTransactionAsync();

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
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                await transaction.RollbackAsync();
                await RepopulateViewDataAsync(Animal.AnimalId);
                return Page();
            }

            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal updated successfully!";
            await RepopulateViewDataAsync(Animal.AnimalId);
            return Page();
        }
    }
}
