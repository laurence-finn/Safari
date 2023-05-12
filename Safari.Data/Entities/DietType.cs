using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("DietType")]
public partial class DietType
{
    [Key]
    [Column("DietTypeID")]
    public int DietTypeId { get; set; }

    [StringLength(10)]
    public string Name { get; set; } = null!;

    [InverseProperty("DietType")]
    public virtual ICollection<Animal> Animal { get; } = new List<Animal>();
}
