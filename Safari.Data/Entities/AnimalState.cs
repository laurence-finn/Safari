//File: AnimalState.cs
//Class: AnimalState
//Description: This class contains the data model for the AnimalState table in the Safari database.

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("AnimalState")]
public partial class AnimalState
{
    //Note that all of the properties in this class are required, because they are not defined as nullable.
    [Key]
    [Column("AnimalStateID")]
    public int AnimalStateId { get; set; }

    [Column("AnimalID")]
    public int AnimalId { get; set; }

    [Column("StateID")]
    public int StateId { get; set; }

    [ForeignKey("StateId")]
    [InverseProperty("AnimalState")]
    public virtual State State { get; set; } = null!;
}
