using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data.Entities;

[Table("AnimalPic")]
public partial class AnimalPic
{
    [Key]
    [Column("AnimalPicID")]
    public int AnimalPicId { get; set; }

    [Column("AnimalID")]
    public int AnimalId { get; set; }

    [StringLength(50)]
    public string FileName { get; set; } = null!;

    [StringLength(100)]
    public string FilePath { get; set; } = null!;

    [StringLength(150)]
    public string? AltText { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime DateUploaded { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime LastModified { get; set; }

    [ForeignKey("AnimalId")]
    [InverseProperty("AnimalPics")]
    public virtual Animal Animal { get; set; } = null!;
}
