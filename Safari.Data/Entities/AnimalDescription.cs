//File: AnimalDescription.cs
//Class: AnimalDescription
//Description: This class contains the data model for the AnimalDescription table in the Safari database.

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

    [Column("AnimalID")]
    public int AnimalId { get; set; }

    public string? Description { get; set; } = null;
}
