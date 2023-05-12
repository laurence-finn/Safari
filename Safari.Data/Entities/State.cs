using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("State")]
public partial class State
{
    [Key]
    [Column("StateID")]
    public int StateId { get; set; }

    [StringLength(20)]
    public string Name { get; set; } = null!;

    [InverseProperty("State")]
    public virtual ICollection<AnimalState> AnimalState { get; } = new List<AnimalState>();
}
