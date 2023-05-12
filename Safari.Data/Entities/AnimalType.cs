using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("AnimalType")]
public partial class AnimalType
{
    [Key]
    [Column("AnimalTypeID")]
    public int AnimalTypeId { get; set; }

    [StringLength(50)]
    public string Name { get; set; } = null!;

    [InverseProperty("AnimalType")]
    public virtual ICollection<Animal> Animal { get; } = new List<Animal>();
}
