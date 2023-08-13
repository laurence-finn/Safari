//File: AdminAnimals.cshtml.cs
//Class: AdminAnimalsPageModel
//Description: This is the code-behind class for the AdminAnimals.cshtml Razor Page.

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
    //Only users with the Admin role can access this page
    [Authorize]
    public class AdminAnimalsPageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IMapper _mapper;

        //Constructor
        public AdminAnimalsPageModel(WildlifeDataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public IList<AnimalViewModel> Animal { get;set; } = default!;

        //OnGetAsync: On HTTP GET, retrieve all the animals from the database and map them to the AnimalViewModel
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

                // Map Animal to AdminAnimalViewModel (populate data from Animal to AnimalViewModel)
                Animal = _mapper.Map<IList<AnimalViewModel>>(animals);
            }
        }
    }
}
