//File: Map.cshtml.cs
//Class: MapPageModel
//Description: This is the code-behind class for the Map page. It generates a list of animals to display.

using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Safari.Data;
using Safari.Web.ViewModels;

namespace Safari.Web.Pages;

public class MapPageModel : PageModel
{
    private readonly WildlifeDataContext _context;
    private readonly IMapper _mapper;

    //Constructor
    public MapPageModel(WildlifeDataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    //This property is a list of AnimalViewModel objects. AnimalViewModel is a view model class that
    //contains data from the Animal model, with some modifications to make it easier to display.
    public IList<AnimalViewModel> Animal { get; set; } = default!;

    public async Task OnGetAsync()
    {
        if (_context.Animal != null)
        {
            // The Interactive Map page model pulls information to AnimalViewModel,
            // just like the View All Animals page. Clicking a state on the map
            // then triggers a DataTables Search to filter the results by state.
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
