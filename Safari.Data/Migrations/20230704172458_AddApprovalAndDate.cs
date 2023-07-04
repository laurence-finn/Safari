using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Safari.Data.Migrations
{
    /// <inheritdoc />
    public partial class AddApprovalAndDate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.AddColumn<DateTime>(
                name: "DateSubmitted",
                table: "AnimalPic",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                table: "AnimalPic",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "DateSubmitted",
                table: "Animal",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                table: "Animal",
                type: "bit",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AnimalPic_AnimalID",
                table: "AnimalPic",
                column: "AnimalID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_AnimalPic_AnimalID",
                table: "AnimalPic");

            migrationBuilder.DropColumn(
                name: "DateSubmitted",
                table: "AnimalPic");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                table: "AnimalPic");

            migrationBuilder.DropColumn(
                name: "DateSubmitted",
                table: "Animal");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                table: "Animal");

            migrationBuilder.CreateIndex(
                name: "IX_AnimalPic_AnimalID",
                table: "AnimalPic",
                column: "AnimalID",
                unique: true);
        }
    }
}
