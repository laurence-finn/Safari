using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    public class DeleteModel : PageModel
    {
        private readonly Safari.Data.WildlifeDataContext _context;

        public DeleteModel(Safari.Data.WildlifeDataContext context)
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

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }
            var animalpic = await _context.AnimalPic.FindAsync(id);

            if (animalpic != null)
            {
                AnimalPic = animalpic;
                _context.AnimalPic.Remove(AnimalPic);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
