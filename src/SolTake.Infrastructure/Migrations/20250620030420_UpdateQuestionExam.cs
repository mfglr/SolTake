using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateQuestionExam : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Exam_ShortName",
                table: "Questions",
                newName: "Exam_Name");

            migrationBuilder.RenameColumn(
                name: "Exam_FullName",
                table: "Questions",
                newName: "Exam_Initialism");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Exam_Name",
                table: "Questions",
                newName: "Exam_ShortName");

            migrationBuilder.RenameColumn(
                name: "Exam_Initialism",
                table: "Questions",
                newName: "Exam_FullName");
        }
    }
}
