using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeDeleteBaheaviorOfRelationBetweenUserAndUserSearch : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs",
                column: "SearchedId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs",
                column: "SearchedId",
                principalTable: "AppUsers",
                principalColumn: "Id");
        }
    }
}
