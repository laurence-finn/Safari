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
    public class ImagesModel : PageModel
    {
        private readonly WildlifeDataContext _context;

        public ImagesModel(WildlifeDataContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
            return Page();
        }

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;


        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid || _context.AnimalPic == null || AnimalPic == null)
            {
                return Page();
            }

            _context.AnimalPic.Add(AnimalPic);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
