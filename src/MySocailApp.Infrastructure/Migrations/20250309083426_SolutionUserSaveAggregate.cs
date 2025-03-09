using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class SolutionUserSaveAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserSaves_Solutions_SolutionId",
                table: "SolutionUserSaves");

            migrationBuilder.DropIndex(
                name: "IX_SolutionUserSaves_SolutionId",
                table: "SolutionUserSaves");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserSaves_SolutionId",
                table: "SolutionUserSaves",
                column: "SolutionId");

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserSaves_Solutions_SolutionId",
                table: "SolutionUserSaves",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
