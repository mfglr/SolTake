using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateSolutionImage : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Video_FrameBlobName",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<float>(
                name: "Video_FrameHeight",
                table: "Solutions",
                type: "real",
                nullable: true);

            migrationBuilder.AddColumn<float>(
                name: "Video_FrameWidth",
                table: "Solutions",
                type: "real",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Video_FrameBlobName",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_FrameHeight",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_FrameWidth",
                table: "Solutions");
        }
    }
}
