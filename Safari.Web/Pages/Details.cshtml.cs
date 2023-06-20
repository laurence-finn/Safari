using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages
{
    public class DetailsPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;

        public Animal Animal { get; set; } = default!;
        public string AnimalDescription { get; set; } = default!;
        public List<AnimalPic> AnimalPics { get; set; } = default!;
        public List<string> AnimalStates { get; set; } = default!;

        public DetailsPageModel(WildlifeDataContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            var animal = await _context.Animal.FirstOrDefaultAsync(m => m.AnimalId == id);
            if (animal == null)
            {
                return NotFound();
            }
            else
            {
                Animal = animal;
            }

            AnimalDescription = _context.AnimalDescription.Where(a => a.AnimalId == id).FirstOrDefault().Description;
            AnimalPics = _context.AnimalPic.Where(a => a.AnimalId == id).ToList();
            AnimalStates = _context.AnimalState.Where(a => a.AnimalId == id).Select(a => a.State.Name).ToList();

            return Page();
        }
    }
}
