using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.JSInterop;
using Safari.Data;

namespace Safari.Web.Pages
{
    public class SubmitAnimalModel : PageModel
    {
        private readonly Safari.Data.WildlifeDataContext _context;

        public SubmitAnimalModel(Safari.Data.WildlifeDataContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["AnimalTypeId"] = new SelectList(
                _context.AnimalType, "AnimalTypeId", "Name");
            ViewData["DietTypeId"] = new SelectList(
                _context.DietType, "DietTypeId", "Name");
            ViewData["StateId"] = new SelectList(
                _context.State, "StateId", "Name");
            return Page();
        }

        [BindProperty]
        public Animal Animal { get; set; } = default!;

        //[BindProperty]
        //public AnimalDescription AnimalDescription { get; set; }

        //[BindProperty]
        //public AnimalPic AnimalPic { get; set; }

        [BindProperty]
        public List<int> SelectedStateIds { get; set; } = default!;

        [BindProperty]
        public AnimalDescription AnimalDescription { get; set; } = default!;

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            // If the model state is invalid for any other reason, cancel the post
            if (!ModelState.IsValid || _context.Animal == null || Animal == null)
            {
                ViewData["AnimalTypeId"] = new SelectList(
                    _context.AnimalType, "AnimalTypeId", "Name");
                ViewData["DietTypeId"] = new SelectList(
                    _context.DietType, "DietTypeId", "Name");
                ViewData["StateId"] = new SelectList(
                    _context.State, "StateId", "Name");
                return Page();
            }

            var NewAnimalID = new SqlParameter("@NewAnimalID", System.Data.SqlDbType.Int)
            {
                Direction = System.Data.ParameterDirection.Output
            };

            var Success = new SqlParameter("@Success", System.Data.SqlDbType.Bit)
            {
                Direction = System.Data.ParameterDirection.Output
            };

            var ErrorMsg = new SqlParameter("@ErrorMsg", System.Data.SqlDbType.NVarChar, 50)
            {
                Direction = System.Data.ParameterDirection.Output
            };

            // Execute the insert_animal stored procedure
            try
            {
                await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalID INT, @Success BIT, @ErrorMsg NVARCHAR(50); EXEC insert_animal @Name, @AnimalTypeId, @DietTypeId, @MinWeight, @MaxWeight, @Height, @IsEndangered, @AverageLifeSpan, @NewAnimalID Output, @Success Output, @ErrorMsg Output",
                    new SqlParameter("@Name", Animal.Name),
                    new SqlParameter("@AnimalTypeId", Animal.AnimalTypeId),
                    new SqlParameter("@DietTypeId", Animal.DietTypeId),
                    new SqlParameter("@MinWeight", Animal.MinWeight),
                    new SqlParameter("@MaxWeight", Animal.MaxWeight),
                    new SqlParameter("@Height", Animal.Height),
                    new SqlParameter("@IsEndangered", Animal.IsEndangered),
                    new SqlParameter("@AverageLifeSpan", Animal.AverageLifeSpan));
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            // Execute the insert_animalstate stored procedure
            try
            {
                foreach (var stateId in SelectedStateIds)
                {
                    await _context.Database.ExecuteSqlRawAsync("EXEC insert_animalstate @AnimalID, @StateID",
                        new SqlParameter("@AnimalID", NewAnimalID.Value),
                        new SqlParameter("@StateID", stateId));
                }
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            try
            {
                if (!string.IsNullOrEmpty(AnimalDescription.Description))
                {
                    await _context.Database.ExecuteSqlRawAsync("EXEC insert_animaldescription @AnimalID, @Description",
                        new SqlParameter("@AnimalID", NewAnimalID.Value),
                        new SqlParameter("@Description", AnimalDescription.Description));
                }
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            //// Execute the insert_animalpic stored procedure
            //await _context.Database.ExecuteSqlRawAsync("EXEC insert_animalpic @AnimalID, @FileName, @FilePath, @AltText, @Source",
            //    new SqlParameter("@AnimalID", NewAnimalID.Value),
            //    new SqlParameter("@FileName", AnimalPic.FileName),
            //    new SqlParameter("@FilePath", AnimalPic.FilePath),
            //    new SqlParameter("@AltText", AnimalPic.AltText),
            //    new SqlParameter("@Source", AnimalPic.Source));

            //// Execute the insert_animaldescription stored procedure
            //await _context.Database.ExecuteSqlRawAsync("EXEC insert_animaldescription @AnimalID, @Description",
            //    new SqlParameter("@AnimalID", NewAnimalID.Value),
            //    new SqlParameter("@Description", AnimalDescription.Description));

            //// Execute the insert_animalstate stored procedure
            //await _context.Database.ExecuteSqlRawAsync("EXEC insert_animalstate @AnimalID, @StateID",
            //    new SqlParameter("@AnimalID", NewAnimalID.Value),
            //    new SqlParameter("@StateID", AnimalState.StateId));

            return RedirectToPage("./Index");
        }
    }
}
