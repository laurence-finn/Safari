using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;
using Safari.Web.ViewModels;
using AutoMapper;

namespace Safari.Web.Pages.Animals
{
    public class ViewAnimalsPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IMapper _mapper;

        public ViewAnimalsPageModel(WildlifeDataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public IList<AnimalViewModel> Animal { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Animal != null)
            {
                var animals = await _context.Animal
                .Include(a => a.AnimalType)
                .Include(a => a.DietType)
                .Include(a => a.AnimalPic)
                .Include(a => a.AnimalState)
                    .ThenInclude(AnimalState => AnimalState.State)
                .ToListAsync();

                Animal = _mapper.Map<IList<AnimalViewModel>>(animals);
            }
        }
    }
}
