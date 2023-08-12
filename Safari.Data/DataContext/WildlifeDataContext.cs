//File: WildlifeDataContext.cs
//Class Name: WildlifeDataContext
//Description: This class contains the data context for the WildlifeData database for Safari. The purpose of a data context is to provide
//a connection to the database and to provide a way to query the database.

using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

public partial class WildlifeDataContext : IdentityDbContext
{
    //Default constructor
    public WildlifeDataContext()
    {
    }

    //Constructor; used to connect to the database
    public WildlifeDataContext(DbContextOptions<WildlifeDataContext> options)
        : base(options)
    {
    }

    //DbSet properties which are used to query the database
    public virtual DbSet<Animal> Animal { get; set; }

    public virtual DbSet<AnimalDescription> AnimalDescription { get; set; }

    public virtual DbSet<AnimalPic> AnimalPic { get; set; }

    public virtual DbSet<AnimalState> AnimalState { get; set; }

    public virtual DbSet<AnimalType> AnimalType { get; set; }

    public virtual DbSet<DietType> DietType { get; set; }

    public virtual DbSet<State> State { get; set; }

    //Method Name: OnConfiguring
    //Purpose: This method is called after the constructor and is used to configure the data context.
    //In future revisions of the website, the connection string may be relocated to a configuration file for security purposes.
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=WildlifeData;Integrated Security=true;" +
                "TrustServerCertificate=true;");
        }
    }

    //Method Name: OnModelCreating
    //Purpose: This method sets up the relationships between tables in the database, such as the lookup tables.
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Animal>(entity =>
        {
            //AnimalType is one to many with Animal; each AnimalType can be applied to many Animals
            entity.HasOne(d => d.AnimalType).WithMany(p => p.Animal).HasConstraintName("FK_Animal_AnimalType");

            //DietType is one to many with Animal; each DietType can be applied to many Animals
            entity.HasOne(d => d.DietType).WithMany(p => p.Animal).HasConstraintName("FK_Animal_DietType");
                        
            entity.HasMany(a => a.AnimalPic) // one Animal has many AnimalPics
            .WithOne(p => p.Animal)   // one AnimalPic belongs to one Animal
            .HasForeignKey(p => p.AnimalId); // the foreign key on AnimalPic
        });

        //AnimalState is a table that contains the many to many relationship between Animal and State
        modelBuilder.Entity<AnimalState>(entity =>
        {
            entity.HasOne(d => d.State).WithMany(p => p.AnimalState)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalState_State");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    //Method Name: OnModelCreatingPartial
    //Description: This is another ASP.NET Core function that configures the data context. Its default implementation is used for this project.
    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
