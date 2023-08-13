//File: Animal.cs
//Class: Animal
//Description: This class contains the data model for the Animal table in the Safari database.

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("Animal")]
public partial class Animal
{
    [Key]
    [Column("AnimalID")]
    public int AnimalId { get; set; }

    //Note that Name is required, because it is not defined as a nullable string.
    [StringLength(50)]
    public string Name { get; set; } = null!;

    [Column("AnimalTypeID")]
    public int? AnimalTypeId { get; set; }

    [Column("DietTypeID")]
    public int? DietTypeId { get; set; }

    //****************
    //Input Validation
    //****************
    //The "Range" attributes are used in the following properties to implement input validation.
    [Column(TypeName = "decimal(6, 2)")]
    [Range(0, double.MaxValue, ErrorMessage = "Weight can't be a negative value.")]
    public decimal? Weight { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    [Range(0, double.MaxValue, ErrorMessage = "Height can't be a negative value.")]
    public decimal? Height { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    [Range(0, double.MaxValue, ErrorMessage = "Length can't be a negative value.")]
    public decimal? Length { get; set; }

    [Display (Name = "Endangered?")]
    public bool? IsEndangered { get; set; }

    [Column (TypeName = "decimal(6, 2)")]
    [Range(1, 200, ErrorMessage = "Average life span must be greater than 0 and less than 200 years.")]
    public decimal? Lifespan { get; set; }

    [Column(TypeName = "datetime")]
    [Display(Name = "Date Submitted")]
    public DateTime? DateSubmitted { get; set; }

    [Display (Name = "Approved")]
    public bool? IsApproved { get; set; }

    [ForeignKey("AnimalTypeId")]
    [InverseProperty("Animal")]
    public virtual AnimalType? AnimalType { get; set; }

    [ForeignKey("DietTypeId")]
    [InverseProperty("Animal")]
    public virtual DietType? DietType { get; set; }

    // Navigation property for AnimalState
    public virtual ICollection<AnimalState> AnimalState { get; set; } = new List<AnimalState>();

    // Navigation property for AnimalPic
    public virtual ICollection<AnimalPic> AnimalPic { get; set; } = new List<AnimalPic>();

}
