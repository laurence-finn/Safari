using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;
using Safari.Web.ViewModels;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class AdminAnimalsPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IMapper _mapper;

        public AdminAnimalsPageModel(WildlifeDataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public IList<AdminAnimalViewModel> Animal { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Animal != null)
            {
                var animals = await _context.Animal
                .Include(a => a.AnimalType)
                .Include(a => a.DietType)
                .Include(a => a.AnimalState)
                    .ThenInclude(AnimalState => AnimalState.State)                    
                .ToListAsync();

                // Map Animal to AdminAnimalViewModel (populate data from Animal to AdminAnimalViewModel)
                Animal = _mapper.Map<IList<AdminAnimalViewModel>>(animals);
            }
        }
    }
}
