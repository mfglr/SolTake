using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeNameOfColumnMediaTypeToMultitmediaType : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "MediaType",
                table: "SolutionMultimedia",
                newName: "MultimediaType");

            migrationBuilder.RenameColumn(
                name: "MediaType",
                table: "QuestionMultimedia",
                newName: "MultimediaType");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "MultimediaType",
                table: "SolutionMultimedia",
                newName: "MediaType");

            migrationBuilder.RenameColumn(
                name: "MultimediaType",
                table: "QuestionMultimedia",
                newName: "MediaType");
        }
    }
}
