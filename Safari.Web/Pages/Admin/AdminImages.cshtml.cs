using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class AdminImagesPageModel : PageModel
    {
        private readonly Safari.Data.WildlifeDataContext _context;

        public AdminImagesPageModel(Safari.Data.WildlifeDataContext context)
        {
            _context = context;
        }

        public IList<AnimalPic> AnimalPic { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.AnimalPic != null)
            {
                AnimalPic = await _context.AnimalPic
                .Include(a => a.Animal)
                .ToListAsync();
            }
        }
    }
}
