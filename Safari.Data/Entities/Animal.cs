using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using Safari.Data.Attributes;

namespace Safari.Data;

[Table("Animal")]
public partial class Animal
{
    [Key]
    [Column("AnimalID")]
    public int AnimalId { get; set; }

    [StringLength(50)]
    public string Name { get; set; } = null!;

    [Column("AnimalTypeID")]
    public int? AnimalTypeId { get; set; }

    [Column("DietTypeID")]
    public int? DietTypeId { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? Weight { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? Height { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? Length { get; set; }

    [Display (Name = "Endangered?")]
    public bool? IsEndangered { get; set; }

    [Range(1, 200, ErrorMessage ="Average life span must be greater than 0 and less than 200 years.")]
    [Column (TypeName = "decimal(6, 2)")]
    public decimal? Lifespan { get; set; }

    [ForeignKey("AnimalTypeId")]
    [InverseProperty("Animal")]
    public virtual AnimalType? AnimalType { get; set; }

    [ForeignKey("DietTypeId")]
    [InverseProperty("Animal")]
    public virtual DietType? DietType { get; set; }

    // Navigation property for AnimalState
    public virtual ICollection<AnimalState> AnimalState { get; set; } = new List<AnimalState>();

    // Navigation property for AnimalPic
    public virtual AnimalPic? AnimalPic { get; set; }

}
