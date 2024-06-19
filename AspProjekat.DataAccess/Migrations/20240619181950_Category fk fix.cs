using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspProjekat.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class Categoryfkfix : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Categories_Jobs_JobId",
                table: "Categories");

            migrationBuilder.DropIndex(
                name: "IX_Categories_JobId",
                table: "Categories");

            migrationBuilder.DropColumn(
                name: "JobId",
                table: "Categories");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "JobId",
                table: "Categories",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Categories_JobId",
                table: "Categories",
                column: "JobId");

            migrationBuilder.AddForeignKey(
                name: "FK_Categories_Jobs_JobId",
                table: "Categories",
                column: "JobId",
                principalTable: "Jobs",
                principalColumn: "Id");
        }
    }
}
