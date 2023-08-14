//File: Details.cshtml.cs
//Class: DetailsPageModel
//Description: This class is the code behind for the Details.cshtml page. It is used to display the details of a selected animal.

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
        public bool PicExists { get; set; } = default!;

        //Constructor
        public DetailsPageModel(WildlifeDataContext context)
        {
            _context = context;
        }

        //OnGetAsync: On HTTP GET, this method gets the animal details from the database so they can be displayed.
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            //If the id is blank or the animal is not found, return a 404 error.
            if (id == null || _context.Animal == null)
            {
                return NotFound();
            }

            //Locate the animal in the database.
            var animal = await _context.Animal.FirstOrDefaultAsync(m => m.AnimalId == id);

            //If the animal cannot be located in the database, return a 404 error.
            if (animal == null)
            {
                return NotFound();
            }
            else
            {
                Animal = animal;
            }

            //Set the AnimalDescription, AnimalPics, and AnimalStates properties.
            AnimalDescription = _context.AnimalDescription.Where(a => a.AnimalId == id).FirstOrDefault().Description;
            AnimalPics = _context.AnimalPic.Where(a => a.AnimalId == id).ToList();
            AnimalStates = _context.AnimalState.Where(a => a.AnimalId == id).Select(a => a.State.Name).ToList();

            //Set the PicExists property, which keeps track of whether or not the animal has any pictures.
            PicExists = AnimalPics.Count > 0;
            
            return Page();
        }
    }
}
