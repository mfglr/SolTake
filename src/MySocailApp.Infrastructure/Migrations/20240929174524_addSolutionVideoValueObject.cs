using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addSolutionVideoValueObject : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "HasVideo",
                table: "Solutions",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "Video_BlobName",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Video_Duration",
                table: "Solutions",
                type: "float",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "HasVideo",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_BlobName",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_Duration",
                table: "Solutions");
        }
    }
}
