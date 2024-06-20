using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AspProjekat.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class benefit : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_Benefits_BenefitId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_BenefitId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "BenefitId",
                table: "Jobs");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BenefitId",
                table: "Jobs",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_BenefitId",
                table: "Jobs",
                column: "BenefitId");

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_Benefits_BenefitId",
                table: "Jobs",
                column: "BenefitId",
                principalTable: "Benefits",
                principalColumn: "Id");
        }
    }
}
