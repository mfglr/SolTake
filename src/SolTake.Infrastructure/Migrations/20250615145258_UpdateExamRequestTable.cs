using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateExamRequestTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ShortName",
                table: "ExamRequests",
                newName: "Name_Value");

            migrationBuilder.RenameColumn(
                name: "FullName",
                table: "ExamRequests",
                newName: "Initialism_Value");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name_Value",
                table: "ExamRequests",
                newName: "ShortName");

            migrationBuilder.RenameColumn(
                name: "Initialism_Value",
                table: "ExamRequests",
                newName: "FullName");
        }
    }
}
