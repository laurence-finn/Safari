using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("AnimalPic")]
public partial class AnimalPic
{
    [Key]
    [Column("AnimalPicID")]
    public int AnimalPicId { get; set; }

    [Column("AnimalID")]
    public int AnimalId { get; set; }

    [StringLength(50)]
    public string? FileName { get; set; } = null;

    [StringLength(100)]
    public string? FilePath { get; set; } = null;

    [StringLength(150)]
    public string? AltText { get; set; } = null;

    [StringLength(500)]
    public string? Source { get; set; } = null;

    // This property temporarily stores the file uploaded by the user,
    // and it handles the upload to the images folder.
    // This is not intended to be saved to the database.
    [NotMapped]
    [FileExtensions(Extensions = ".jpg,.jpeg,.png", ErrorMessage = "Please select a valid image file.")]
    public IFormFile? File { get; set; } = null;
}
