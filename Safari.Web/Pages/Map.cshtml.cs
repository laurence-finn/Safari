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

    public MapPageModel(WildlifeDataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public IList<AnimalViewModel> Animal { get; set; } = default!;

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

            // Map Animal to AnimalViewModel (populate data from Animal to AnimalViewModel)
            Animal = _mapper.Map<IList<AnimalViewModel>>(animals);
        }
    }
}
