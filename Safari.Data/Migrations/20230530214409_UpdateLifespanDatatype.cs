using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Safari.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdateLifespanDatatype : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Lifespan",
                table: "Animal",
                type: "decimal(6,2)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Lifespan",
                table: "Animal",
                type: "int",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(6,2)",
                oldNullable: true);
        }
    }
}
