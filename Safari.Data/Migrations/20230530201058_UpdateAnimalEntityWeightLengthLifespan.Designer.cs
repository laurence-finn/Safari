﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Safari.Data;

#nullable disable

namespace Safari.Data.Migrations
{
    [DbContext(typeof(WildlifeDataContext))]
    [Migration("20230530201058_UpdateAnimalEntityWeightLengthLifespan")]
    partial class UpdateAnimalEntityWeightLengthLifespan
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("Safari.Data.Animal", b =>
                {
                    b.Property<int>("AnimalId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("AnimalID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AnimalId"));

                    b.Property<int?>("AnimalTypeId")
                        .HasColumnType("int")
                        .HasColumnName("AnimalTypeID");

                    b.Property<int?>("DietTypeId")
                        .HasColumnType("int")
                        .HasColumnName("DietTypeID");

                    b.Property<decimal?>("Height")
                        .HasColumnType("decimal(6, 2)");

                    b.Property<bool?>("IsEndangered")
                        .HasColumnType("bit");

                    b.Property<decimal?>("Length")
                        .HasColumnType("decimal(6, 2)");

                    b.Property<int?>("Lifespan")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<decimal?>("Weight")
                        .HasColumnType("decimal(6, 2)");

                    b.HasKey("AnimalId");

                    b.HasIndex("AnimalTypeId");

                    b.HasIndex("DietTypeId");

                    b.ToTable("Animal");
                });

            modelBuilder.Entity("Safari.Data.AnimalDescription", b =>
                {
                    b.Property<int>("AnimalDescriptionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("AnimalDescriptionID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AnimalDescriptionId"));

                    b.Property<int>("AnimalId")
                        .HasColumnType("int")
                        .HasColumnName("AnimalID");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AnimalDescriptionId");

                    b.ToTable("AnimalDescription");
                });

            modelBuilder.Entity("Safari.Data.AnimalPic", b =>
                {
                    b.Property<int>("AnimalPicId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("AnimalPicID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AnimalPicId"));

                    b.Property<string>("AltText")
                        .HasMaxLength(150)
                        .HasColumnType("nvarchar(150)");

                    b.Property<int>("AnimalId")
                        .HasColumnType("int")
                        .HasColumnName("AnimalID");

                    b.Property<string>("FileName")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("FilePath")
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<string>("Source")
                        .HasMaxLength(500)
                        .HasColumnType("nvarchar(500)");

                    b.HasKey("AnimalPicId");

                    b.HasIndex("AnimalId")
                        .IsUnique();

                    b.ToTable("AnimalPic");
                });

            modelBuilder.Entity("Safari.Data.AnimalState", b =>
                {
                    b.Property<int>("AnimalStateId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("AnimalStateID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AnimalStateId"));

                    b.Property<int>("AnimalId")
                        .HasColumnType("int")
                        .HasColumnName("AnimalID");

                    b.Property<int>("StateId")
                        .HasColumnType("int")
                        .HasColumnName("StateID");

                    b.HasKey("AnimalStateId");

                    b.HasIndex("AnimalId");

                    b.HasIndex("StateId");

                    b.ToTable("AnimalState");
                });

            modelBuilder.Entity("Safari.Data.AnimalType", b =>
                {
                    b.Property<int>("AnimalTypeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("AnimalTypeID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AnimalTypeId"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("AnimalTypeId");

                    b.ToTable("AnimalType");
                });

            modelBuilder.Entity("Safari.Data.DietType", b =>
                {
                    b.Property<int>("DietTypeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("DietTypeID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("DietTypeId"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(10)
                        .HasColumnType("nvarchar(10)");

                    b.HasKey("DietTypeId");

                    b.ToTable("DietType");
                });

            modelBuilder.Entity("Safari.Data.State", b =>
                {
                    b.Property<int>("StateId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("StateID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("StateId"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.HasKey("StateId");

                    b.ToTable("State");
                });

            modelBuilder.Entity("Safari.Data.Animal", b =>
                {
                    b.HasOne("Safari.Data.AnimalType", "AnimalType")
                        .WithMany("Animal")
                        .HasForeignKey("AnimalTypeId")
                        .HasConstraintName("FK_Animal_AnimalType");

                    b.HasOne("Safari.Data.DietType", "DietType")
                        .WithMany("Animal")
                        .HasForeignKey("DietTypeId")
                        .HasConstraintName("FK_Animal_DietType");

                    b.Navigation("AnimalType");

                    b.Navigation("DietType");
                });

            modelBuilder.Entity("Safari.Data.AnimalPic", b =>
                {
                    b.HasOne("Safari.Data.Animal", null)
                        .WithOne("AnimalPic")
                        .HasForeignKey("Safari.Data.AnimalPic", "AnimalId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Safari.Data.AnimalState", b =>
                {
                    b.HasOne("Safari.Data.Animal", null)
                        .WithMany("AnimalState")
                        .HasForeignKey("AnimalId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Safari.Data.State", "State")
                        .WithMany("AnimalState")
                        .HasForeignKey("StateId")
                        .IsRequired()
                        .HasConstraintName("FK_AnimalState_State");

                    b.Navigation("State");
                });

            modelBuilder.Entity("Safari.Data.Animal", b =>
                {
                    b.Navigation("AnimalPic")
                        .IsRequired();

                    b.Navigation("AnimalState");
                });

            modelBuilder.Entity("Safari.Data.AnimalType", b =>
                {
                    b.Navigation("Animal");
                });

            modelBuilder.Entity("Safari.Data.DietType", b =>
                {
                    b.Navigation("Animal");
                });

            modelBuilder.Entity("Safari.Data.State", b =>
                {
                    b.Navigation("AnimalState");
                });
#pragma warning restore 612, 618
        }
    }
}
