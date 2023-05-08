using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("AnimalState")]
public partial class AnimalState
{
    [Key]
    [Column("AnimalStateID")]
    public int AnimalStateId { get; set; }

    [Column("AnimalID")]
    public int AnimalId { get; set; }

    [Column("StateID")]
    public int StateId { get; set; }

    [ForeignKey("AnimalId")]
    [InverseProperty("AnimalStates")]
    public virtual Animal Animal { get; set; } = null!;

    [ForeignKey("StateId")]
    [InverseProperty("AnimalStates")]
    public virtual State State { get; set; } = null!;
}
