using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspProjekat.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class Fixedanothermanytomanytablebug : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Technology_TechnologyId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_TechnologyId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "TechnologyId",
                table: "Jobs");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "TechnologyId",
                table: "Jobs",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_TechnologyId",
                table: "Jobs",
                column: "TechnologyId");

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Technology_TechnologyId",
                table: "Jobs",
                column: "TechnologyId",
                principalTable: "Technology",
                principalColumn: "Id");
        }
    }
}
