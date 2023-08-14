//File: ViewAnimals.cshtml.cs
//Class: ViewAnimalsPageModel
//Description: This is the code-behind class for the ViewAnimals.cshtml page. It is responsible for generating a list of all animals in the database.

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

        //Constructor
        public ViewAnimalsPageModel(WildlifeDataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public IList<AnimalViewModel> Animal { get;set; } = default!;

        //OnGetAsync: On HTTP GET, retrieve all animals from the database and map them to AnimalViewModels.
        //Currently, unapproved animals are filtered by the HTML page, but in the future this code may be updated
        //to filter by approval status here.
        public async Task OnGetAsync()
        {
            if (_context.Animal != null)
            {
                //LINQ query to retrieve all animals from the database
                var animals = await _context.Animal
                .Include(a => a.AnimalType)
                .Include(a => a.DietType)
                .Include(a => a.AnimalPic)
                .Include(a => a.AnimalState)
                    .ThenInclude(AnimalState => AnimalState.State)
                .ToListAsync();

                // Map Animal to AnimalViewModel (populate data from Animal to AnimalViewModel)
                Animal = _mapper.Map<IList<AnimalViewModel>>(animals);
            }
        }
    }
}
