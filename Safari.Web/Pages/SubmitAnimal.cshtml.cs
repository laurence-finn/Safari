using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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

        [BindProperty]
        public List<int> SelectedStateIds { get; set; } = default!;

        [BindProperty]
        public AnimalDescription AnimalDescription { get; set; } = default!;

        [BindProperty]
        public AnimalPic AnimalPic { get; set; } = default!;

        public async Task<IActionResult> OnPostAsync()
        {
            // If the model state is invalid for any other reason, cancel the post
            if (!ModelState.IsValid)
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
                await _context.Database.ExecuteSqlRawAsync("EXEC insert_animal @Name, @AnimalTypeId, @DietTypeId, @MinWeight, @MaxWeight, @Height, @IsEndangered, @AverageLifeSpan, @NewAnimalID Output, @Success Output, @ErrorMsg Output",
                    new SqlParameter("@Name", Animal.Name),
                    new SqlParameter("@AnimalTypeId", Animal.AnimalTypeId),
                    new SqlParameter("@DietTypeId", Animal.DietTypeId),
                    new SqlParameter("@MinWeight", Animal.MinWeight),
                    new SqlParameter("@MaxWeight", Animal.MaxWeight),
                    new SqlParameter("@Height", Animal.Height),
                    new SqlParameter("@IsEndangered", Animal.IsEndangered),
                    new SqlParameter("@AverageLifeSpan", Animal.AverageLifeSpan),
                    NewAnimalID,
                    Success,
                    ErrorMsg);
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            //Execute the insert_animalstate stored procedure
            try
            {
                foreach (var stateId in SelectedStateIds)
                {
                    await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalStateID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalstate @AnimalID, @StateID, @NewAnimalStateID Output, @Success Output, @ErrorMsg Output",
                        new SqlParameter("@AnimalID", NewAnimalID.Value),
                        new SqlParameter("@StateID", stateId));
                }
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            //Execute the insert_animaldescription stored procedure
            try
            {
                if (!string.IsNullOrEmpty(AnimalDescription.Description))
                {
                    await _context.Database.ExecuteSqlRawAsync("DECLARE @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animaldescription @AnimalID, @Description, @Success Output, @ErrorMsg Output",
                        new SqlParameter("@AnimalID", NewAnimalID.Value),
                        new SqlParameter("@Description", AnimalDescription.Description));
                }
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                return Page();
            }

            if (AnimalPic.File != null)
            {
                // Generate a unique file name for the uploaded image
                // Format is AnimalID + "_" + Name + "_1" + extension,
                // where 1 indicates the number of images. Since this is the first image, the number is 1.
                // This is stored in the database.
                AnimalPic.FileName = $"{NewAnimalID.Value}_{Animal.Name}_1{Path.GetExtension(AnimalPic.File.FileName)}";

                // Set the file path to the "images" folder in the wwwroot directory
                // This is stored in the database.
                AnimalPic.FilePath = Path.Combine("images", AnimalPic.FileName);

                // Save the uploaded file to the images folder.
                // In the future, I will add a moderation queue to approve images first.
                var FullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", AnimalPic.FilePath);
                using (var FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    await AnimalPic.File.CopyToAsync(FileStream);
                }

                // Save the AnimalPic object to the database
                try
                {
                    await _context.Database.ExecuteSqlRawAsync("DECLARE @NewAnimalPicID int, @Success bit, @ErrorMsg nvarchar(50); EXEC insert_animalpic @AnimalID, @FileName, @FilePath, @AltText, @Source, @NewAnimalPicID Output, @Success Output, @ErrorMsg Output",
                        new SqlParameter("@AnimalID", NewAnimalID.Value),
                        new SqlParameter("@FileName", AnimalPic.FileName),
                        new SqlParameter("@FilePath", AnimalPic.FilePath),
                        new SqlParameter("@AltText", AnimalPic.AltText),
                        new SqlParameter("@Source", AnimalPic.Source));
                }
                catch (SqlException ex)
                {
                    TempData["ErrorMessage"] = ex.Message;
                    return Page();
                }
            }


            return RedirectToPage("./Index");
        }
    }
}
