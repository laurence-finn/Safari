using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Safari.Data;

namespace Safari.Web.Pages
{
    public class DetailsPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;

        public Animal Animal { get; set; } = default!;

        public DetailsPageModel(WildlifeDataContext context)
        {
            _context = context;
        }

        public IActionResult OnGet(int AnimalId)
        {
            Animal = _context.Animal.Find(AnimalId);

            if (Animal == null)
            {
                TempData["ErrorMessage"] = $"Animal with id {AnimalId} not found!";
                return Page();
            }

            var AnimalPics = _context.AnimalPic.Where(a => a.AnimalId == AnimalId).ToList();
            var AnimalStates = _context.AnimalState.Where(a => a.AnimalId == AnimalId).ToList();

            return Page();
        }
    }
}
