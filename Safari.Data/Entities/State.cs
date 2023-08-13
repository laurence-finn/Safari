//File: State.cs
//Class: State
//Description: This class contains the data model for the State table in the Safari database.

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("State")]
public partial class State
{
    //Note that this model does not contain any nullable properties (therefore all are required).
    [Key]
    [Column("StateID")]
    public int StateId { get; set; }

    [StringLength(20)]
    public string Name { get; set; } = null!;

    //This is the navigation property, which helps connect the State lookup table to the AnimalState table.
    [InverseProperty("State")]
    public virtual ICollection<AnimalState> AnimalState { get; } = new List<AnimalState>();
}
