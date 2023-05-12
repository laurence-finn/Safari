using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Animals
{
    public class IndexModel : PageModel
    {
        private readonly WildlifeDataContext _context;

        public IndexModel(WildlifeDataContext context)
        {
            _context = context;
        }

        public IList<Animal> Animal { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Animal != null)
            {
                Animal = await _context.Animal
                .Include(a => a.AnimalType)
                .Include(a => a.DietType).ToListAsync();
            }
        }
    }
}
