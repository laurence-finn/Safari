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

    [Column(TypeName = "datetime")]
    [Display(Name = "Date Submitted")]
    public DateTime? DateSubmitted { get; set; }

    [Display(Name = "Approved")]
    public bool? IsApproved { get; set; }

    // This property temporarily stores the file uploaded by the user,
    // and it handles the upload to the images folder.
    // This is not intended to be saved to the database.
    [NotMapped]
    public IFormFile? File { get; set; } = null;

    // This is the navigation property
    public virtual Animal? Animal { get; set; }
}
