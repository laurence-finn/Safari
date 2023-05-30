using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Safari.Data.Migrations
{
    /// <inheritdoc />
    public partial class UpdateAnimalEntityWeightLengthLifespan : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AnimalDescription",
                columns: table => new
                {
                    AnimalDescriptionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AnimalID = table.Column<int>(type: "int", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AnimalDescription", x => x.AnimalDescriptionID);
                });

            migrationBuilder.CreateTable(
                name: "AnimalType",
                columns: table => new
                {
                    AnimalTypeID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AnimalType", x => x.AnimalTypeID);
                });

            migrationBuilder.CreateTable(
                name: "DietType",
                columns: table => new
                {
                    DietTypeID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DietType", x => x.DietTypeID);
                });

            migrationBuilder.CreateTable(
                name: "State",
                columns: table => new
                {
                    StateID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_State", x => x.StateID);
                });

            migrationBuilder.CreateTable(
                name: "Animal",
                columns: table => new
                {
                    AnimalID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    AnimalTypeID = table.Column<int>(type: "int", nullable: true),
                    DietTypeID = table.Column<int>(type: "int", nullable: true),
                    Weight = table.Column<decimal>(type: "decimal(6,2)", nullable: true),
                    Height = table.Column<decimal>(type: "decimal(6,2)", nullable: true),
                    Length = table.Column<decimal>(type: "decimal(6,2)", nullable: true),
                    IsEndangered = table.Column<bool>(type: "bit", nullable: true),
                    Lifespan = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Animal", x => x.AnimalID);
                    table.ForeignKey(
                        name: "FK_Animal_AnimalType",
                        column: x => x.AnimalTypeID,
                        principalTable: "AnimalType",
                        principalColumn: "AnimalTypeID");
                    table.ForeignKey(
                        name: "FK_Animal_DietType",
                        column: x => x.DietTypeID,
                        principalTable: "DietType",
                        principalColumn: "DietTypeID");
                });

            migrationBuilder.CreateTable(
                name: "AnimalPic",
                columns: table => new
                {
                    AnimalPicID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AnimalID = table.Column<int>(type: "int", nullable: false),
                    FileName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    FilePath = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    AltText = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: true),
                    Source = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AnimalPic", x => x.AnimalPicID);
                    table.ForeignKey(
                        name: "FK_AnimalPic_Animal_AnimalID",
                        column: x => x.AnimalID,
                        principalTable: "Animal",
                        principalColumn: "AnimalID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AnimalState",
                columns: table => new
                {
                    AnimalStateID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AnimalID = table.Column<int>(type: "int", nullable: false),
                    StateID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AnimalState", x => x.AnimalStateID);
                    table.ForeignKey(
                        name: "FK_AnimalState_Animal_AnimalID",
                        column: x => x.AnimalID,
                        principalTable: "Animal",
                        principalColumn: "AnimalID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AnimalState_State",
                        column: x => x.StateID,
                        principalTable: "State",
                        principalColumn: "StateID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Animal_AnimalTypeID",
                table: "Animal",
                column: "AnimalTypeID");

            migrationBuilder.CreateIndex(
                name: "IX_Animal_DietTypeID",
                table: "Animal",
                column: "DietTypeID");

            migrationBuilder.CreateIndex(
                name: "IX_AnimalPic_AnimalID",
                table: "AnimalPic",
                column: "AnimalID",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AnimalState_AnimalID",
                table: "AnimalState",
                column: "AnimalID");

            migrationBuilder.CreateIndex(
                name: "IX_AnimalState_StateID",
                table: "AnimalState",
                column: "StateID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AnimalDescription");

            migrationBuilder.DropTable(
                name: "AnimalPic");

            migrationBuilder.DropTable(
                name: "AnimalState");

            migrationBuilder.DropTable(
                name: "Animal");

            migrationBuilder.DropTable(
                name: "State");

            migrationBuilder.DropTable(
                name: "AnimalType");

            migrationBuilder.DropTable(
                name: "DietType");
        }
    }
}
