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

    [Required]
    [StringLength(50)]
    public string Name { get; set; } = null!;

    [Required]
    [Column("StateID")]
    public int StateId { get; set; }

    [Column("DietTypeID")]
    public int? DietTypeId { get; set; }

    public int? MinWeight { get; set; }

    public int? MaxWeight { get; set; }

    public int? Height { get; set; }

    [Column("IsEndangered")]
    public bool? IsEndangered { get; set; }

    public int? AverageLifeSpan { get; set; }

    [Column("AnimalPicID")]
    public int? AnimalPicId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? DateCreated { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? LastModified { get; set; }

    [InverseProperty("Animal")]
    public virtual ICollection<AnimalDescription> AnimalDescriptions { get; } = new List<AnimalDescription>();

    [InverseProperty("Animal")]
    public virtual ICollection<AnimalPic> AnimalPics { get; } = new List<AnimalPic>();

    [InverseProperty("Animal")]
    public virtual ICollection<AnimalState> AnimalStates { get; } = new List<AnimalState>();

    [ForeignKey("DietTypeId")]
    [InverseProperty("Animals")]
    public virtual DietType? DietType { get; set; }
}
