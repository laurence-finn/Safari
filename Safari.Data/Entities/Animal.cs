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
    [Display (Name = "Name")]
    public string Name { get; set; } = null!;

    [Column("AnimalTypeID")]
    public int? AnimalTypeId { get; set; }

    [Column("DietTypeID")]
    public int? DietTypeId { get; set; }

    [LessThanOrEqual(nameof(MaxWeight), ErrorMessage = "Minimum Weight must be less than or equal to Maximum Weight.")]
    [Column(TypeName = "decimal(6, 2)")]
    [Display (Name = "Min Weight")]
    public decimal? MinWeight { get; set; }

    [GreaterThanOrEqual(nameof(MinWeight), ErrorMessage = "Maximum Weight must be greater than or equal to Minimum Weight.")]
    [Column(TypeName = "decimal(6, 2)")]
    [Display (Name = "Max Weight")]
    public decimal? MaxWeight { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    [Display (Name = "Avg. Height")]
    public decimal? Height { get; set; }

    [Display (Name = "Endangered?")]
    public bool? IsEndangered { get; set; }

    [Range(1, 200, ErrorMessage ="Average life span must be greater than 0 and less than 200 years.")]
    [Display (Name = "Avg. Lifespan")]
    public int? AverageLifeSpan { get; set; }

    [ForeignKey("AnimalTypeId")]
    [InverseProperty("Animal")]
    [Display(Name = "Type")]
    public virtual AnimalType? AnimalType { get; set; }

    [ForeignKey("DietTypeId")]
    [InverseProperty("Animal")]
    [Display (Name = "Diet")]
    public virtual DietType? DietType { get; set; }
}
