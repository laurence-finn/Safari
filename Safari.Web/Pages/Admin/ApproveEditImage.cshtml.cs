using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Safari.Data;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class ApproveEditImagePageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        public ApproveEditImagePageModel(WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;

        private async Task<IActionResult> RepopulateViewDataAsync(int? id)
        {
            var animalpic = await _context.AnimalPic.FirstOrDefaultAsync(m => m.AnimalPicId == id);
            if (animalpic == null)
            {
                return NotFound();
            }
            AnimalPic = animalpic;
            ViewData["AnimalId"] = new SelectList(_context.Animal, "AnimalId", "Name");
            return Page();
        }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            await RepopulateViewDataAsync(id);
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
                return Page();
            }

            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                await _repository.UpdateAnimalPicAsync(AnimalPic);
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                await transaction.RollbackAsync();
                await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
                return Page();
            }

            await transaction.CommitAsync();
            TempData["SuccessMessage"] = "Animal image updated successfully!";
            await RepopulateViewDataAsync(AnimalPic.AnimalPicId);
            return Page();
        }
    }
}
