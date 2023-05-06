using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

[Table("AnimalDescription")]
public partial class AnimalDescription
{
    [Key]
    [Column("AnimalDescriptionID")]
    public int AnimalDescriptionId { get; set; }

    [Required]
    [Column("AnimalID")]
    public int AnimalId { get; set; }

    public string Description { get; set; } = null!;

    [ForeignKey("AnimalId")]
    [InverseProperty("AnimalDescriptions")]
    public virtual Animal Animal { get; set; } = null!;
}
