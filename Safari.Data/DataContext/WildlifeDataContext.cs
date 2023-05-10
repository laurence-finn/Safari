using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Safari.Data;

public partial class WildlifeDataContext : DbContext
{
    private readonly string _connection;

    public WildlifeDataContext(string connection)
    {
        _connection = connection;
    }

    public WildlifeDataContext(DbContextOptions<WildlifeDataContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Animal> Animals { get; set; }

    public virtual DbSet<AnimalDescription> AnimalDescriptions { get; set; }

    public virtual DbSet<AnimalPic> AnimalPics { get; set; }

    public virtual DbSet<AnimalState> AnimalStates { get; set; }

    public virtual DbSet<AnimalType> AnimalTypes { get; set; }

    public virtual DbSet<DietType> DietTypes { get; set; }

    public virtual DbSet<State> States { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer(_connection);

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Animal>(entity =>
        {
            entity.HasOne(d => d.AnimalType).WithMany(p => p.Animals).HasConstraintName("FK_Animal_AnimalType");

            entity.HasOne(d => d.DietType).WithMany(p => p.Animals).HasConstraintName("FK_Animal_DietType");
        });

        modelBuilder.Entity<AnimalDescription>(entity =>
        {
            entity.HasOne(d => d.Animal).WithMany(p => p.AnimalDescriptions)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalDescription_Animal");
        });

        modelBuilder.Entity<AnimalPic>(entity =>
        {
            entity.HasOne(d => d.Animal).WithMany(p => p.AnimalPics)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalPic_Animal");
        });

        modelBuilder.Entity<AnimalState>(entity =>
        {
            entity.HasOne(d => d.Animal).WithMany(p => p.AnimalStates)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalState_Animal");

            entity.HasOne(d => d.State).WithMany(p => p.AnimalStates)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalState_State");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
