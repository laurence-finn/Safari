using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Safari.Data;

public partial class WildlifeDataContext : DbContext
{
    public WildlifeDataContext()
    {
    }

    public WildlifeDataContext(DbContextOptions<WildlifeDataContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Animal> Animal { get; set; }

    public virtual DbSet<AnimalDescription> AnimalDescription { get; set; }

    public virtual DbSet<AnimalPic> AnimalPic { get; set; }

    public virtual DbSet<AnimalState> AnimalState { get; set; }

    public virtual DbSet<AnimalType> AnimalType { get; set; }

    public virtual DbSet<DietType> DietType { get; set; }

    public virtual DbSet<State> State { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer(
                "Data Source=.\\SQLEXPRESS;Initial Catalog=WildlifeData;Integrated Security=true;" +
                "TrustServerCertificate=true;");
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Animal>(entity =>
        {
            entity.HasOne(d => d.AnimalType).WithMany(p => p.Animal).HasConstraintName("FK_Animal_AnimalType");

            entity.HasOne(d => d.DietType).WithMany(p => p.Animal).HasConstraintName("FK_Animal_DietType");
        });

        modelBuilder.Entity<AnimalState>(entity =>
        {
            entity.HasOne(d => d.State).WithMany(p => p.AnimalState)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalState_State");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
