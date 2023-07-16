using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    public class EditModel : PageModel
    {
        private readonly Safari.Data.WildlifeDataContext _context;

        public EditModel(Safari.Data.WildlifeDataContext context)
        {
            _context = context;
        }

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            var animalpic =  await _context.AnimalPic.FirstOrDefaultAsync(m => m.AnimalPicId == id);
            if (animalpic == null)
            {
                return NotFound();
            }
            AnimalPic = animalpic;
           ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(AnimalPic).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AnimalPicExists(AnimalPic.AnimalPicId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool AnimalPicExists(int id)
        {
          return (_context.AnimalPic?.Any(e => e.AnimalPicId == id)).GetValueOrDefault();
        }
    }
}
