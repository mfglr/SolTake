using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeNameOfTheColumnsAppUserIdToUserId : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserFollowNotifications_Users_AppUserId",
                table: "UserFollowNotifications");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "UserFollowNotifications",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "SolutionUserVotes",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserVotes_AppUserId_Type",
                table: "SolutionUserVotes",
                newName: "IX_SolutionUserVotes_UserId_Type");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "SolutionUserVoteNotifications",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "QuestionUserLikes",
                newName: "UserId");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "QuestionUserLikeNotifications",
                newName: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserFollowNotifications_Users_UserId",
                table: "UserFollowNotifications",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserFollowNotifications_Users_UserId",
                table: "UserFollowNotifications");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "UserFollowNotifications",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "SolutionUserVotes",
                newName: "AppUserId");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserVotes_UserId_Type",
                table: "SolutionUserVotes",
                newName: "IX_SolutionUserVotes_AppUserId_Type");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "SolutionUserVoteNotifications",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "QuestionUserLikes",
                newName: "AppUserId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "QuestionUserLikeNotifications",
                newName: "AppUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserFollowNotifications_Users_AppUserId",
                table: "UserFollowNotifications",
                column: "AppUserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
