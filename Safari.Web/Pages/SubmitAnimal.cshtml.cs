using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Safari.Data;

namespace Safari.Web.Pages
{
    public class SubmitAnimalModel : PageModel
    {
        private readonly Safari.Data.WildlifeDataContext _context;

        public SubmitAnimalModel(Safari.Data.WildlifeDataContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["AnimalTypeId"] = new SelectList(_context.AnimalTypes, "AnimalTypeId", "Name");
        ViewData["DietTypeId"] = new SelectList(_context.DietTypes, "DietTypeId", "Name");
            return Page();
        }

        [BindProperty]
        public Animal Animal { get; set; } = default!;
        

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
          if (!ModelState.IsValid || _context.Animals == null || Animal == null)
            {
                return Page();
            }

            _context.Animals.Add(Animal);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
