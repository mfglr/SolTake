using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeNameOfTableUserSearchsToUserUserSearchs : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_UserSearchs",
                table: "UserSearchs");

            migrationBuilder.RenameTable(
                name: "UserSearchs",
                newName: "UserUserSearchs");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserUserSearchs",
                table: "UserUserSearchs",
                column: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_UserUserSearchs",
                table: "UserUserSearchs");

            migrationBuilder.RenameTable(
                name: "UserUserSearchs",
                newName: "UserSearchs");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserSearchs",
                table: "UserSearchs",
                column: "Id");
        }
    }
}
