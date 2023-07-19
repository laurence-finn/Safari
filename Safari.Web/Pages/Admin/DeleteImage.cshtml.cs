﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Safari.Data;

namespace Safari.Web.Pages.Admin
{
    [Authorize]
    public class DeleteImageModel : PageModel
    {
        private readonly WildlifeDataContext _context;
        private readonly IWildlifeRepository _repository;

        public DeleteImageModel(Safari.Data.WildlifeDataContext context, IWildlifeRepository repository)
        {
            _context = context;
            _repository = repository;
        }

        [BindProperty]
      public AnimalPic AnimalPic { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            var animalpic = await _context.AnimalPic.FirstOrDefaultAsync(m => m.AnimalPicId == id);

            if (animalpic == null)
            {
                return NotFound();
            }
            else 
            {
                AnimalPic = animalpic;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null || _context.AnimalPic == null)
            {
                return NotFound();
            }

            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                //delete the image from webroot
                var imagePath = System.IO.Path.Combine("wwwroot", "images", AnimalPic.FileName);
                System.IO.File.Delete(imagePath);
                await _repository.DeleteAnimalPicAsync(AnimalPic);
                await transaction.CommitAsync();
                TempData["SuccessMessage"] = "Animal image deleted successfully!";
            }
            catch (SqlException ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                await transaction.RollbackAsync();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "There was an error deleting the image from the website: " + ex.Message;
                await transaction.RollbackAsync();
            }

            return RedirectToPage("./AdminImages");
        }
    }
}
