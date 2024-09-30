using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class removeHasVideoColumnFromSolutionTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "HasVideo",
                table: "Solutions");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "HasVideo",
                table: "Solutions",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
