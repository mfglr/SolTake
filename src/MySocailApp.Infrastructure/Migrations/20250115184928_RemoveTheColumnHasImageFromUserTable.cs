using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveTheColumnHasImageFromUserTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "HasImage",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "SolutionUserSaves",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "QuestionUserSaves",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "Notifications",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_Notifications_AppUserId",
                table: "Notifications",
                newName: "IX_Notifications_UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "CommentUserLikes",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "CommentUserLikeNotifications",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "Comments",
                newName: "UserId");

            migrationBuilder.UpdateData(
                table: "TermsOfUses",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "BlobNameEn", "BlobNameTr" },
                values: new object[] { "terms_of_use_en", "terms_of_use_tr" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "SolutionUserSaves",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "QuestionUserSaves",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Notifications",
                newName: "AppUserId");

            migrationBuilder.RenameIndex(
                name: "IX_Notifications_UserId",
                table: "Notifications",
                newName: "IX_Notifications_AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "CommentUserLikes",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "CommentUserLikeNotifications",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Comments",
                newName: "AppUserId");

            migrationBuilder.AddColumn<bool>(
                name: "HasImage",
                table: "Users",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "TermsOfUses",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "BlobNameEn", "BlobNameTr" },
                values: new object[] { "terms_of_use_version1_en.html", "terms_of_use_version1_tr.html" });
        }
    }
}
