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

    [StringLength(50)]
    public string Name { get; set; } = null!;

    [Column("AnimalTypeID")]
    public int? AnimalTypeId { get; set; }

    [Column("DietTypeID")]
    public int? DietTypeId { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? MinWeight { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? MaxWeight { get; set; }

    [Column(TypeName = "decimal(6, 2)")]
    public decimal? Height { get; set; }

    public bool? IsEndangered { get; set; }

    public int? AverageLifeSpan { get; set; }

    [ForeignKey("AnimalTypeId")]
    [InverseProperty("Animal")]
    public virtual AnimalType? AnimalType { get; set; }

    [ForeignKey("DietTypeId")]
    [InverseProperty("Animal")]
    public virtual DietType? DietType { get; set; }
}
