//File: DietType.cs
//Class: DietType
//Description: This class contains the data model for the DietType table in the Safari database.

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("DietType")]
public partial class DietType
{
    //Note that this model does not contain any nullable properties (therefore all are required).
    [Key]
    [Column("DietTypeID")]
    public int DietTypeId { get; set; }

    [StringLength(10)]
    public string Name { get; set; } = null!;

    //This is the navigation property, which helps connect the DietType table to the Animal table.
    [InverseProperty("DietType")]
    public virtual ICollection<Animal> Animal { get; } = new List<Animal>();
}
