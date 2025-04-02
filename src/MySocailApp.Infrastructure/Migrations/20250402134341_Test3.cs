using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Test3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "SolutionContent",
                table: "Notifications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SolutionId",
                table: "Notifications",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SolutionMedia_BlobName",
                table: "Notifications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SolutionMedia_BlobNameOfFrame",
                table: "Notifications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SolutionMedia_ContainerName",
                table: "Notifications",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "SolutionMedia_Duration",
                table: "Notifications",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "SolutionMedia_Height",
                table: "Notifications",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SolutionMedia_MultimediaType",
                table: "Notifications",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "SolutionMedia_Size",
                table: "Notifications",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "SolutionMedia_Width",
                table: "Notifications",
                type: "float",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SolutionContent",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionId",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_BlobName",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_BlobNameOfFrame",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_ContainerName",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_Duration",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_Height",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_MultimediaType",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_Size",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "SolutionMedia_Width",
                table: "Notifications");
        }
    }
}
