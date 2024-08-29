using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Test1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLike_AppUsers_AppUserId",
                table: "CommentUserLike");

            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLike_Comments_CommentId",
                table: "CommentUserLike");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CommentUserLike",
                table: "CommentUserLike");

            migrationBuilder.RenameTable(
                name: "CommentUserLike",
                newName: "CommentUserLikes");

            migrationBuilder.RenameIndex(
                name: "IX_CommentUserLike_CommentId",
                table: "CommentUserLikes",
                newName: "IX_CommentUserLikes_CommentId");

            migrationBuilder.RenameIndex(
                name: "IX_CommentUserLike_AppUserId",
                table: "CommentUserLikes",
                newName: "IX_CommentUserLikes_AppUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CommentUserLikes",
                table: "CommentUserLikes",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 945, DateTimeKind.Utc).AddTicks(9733));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 945, DateTimeKind.Utc).AddTicks(9739));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(757));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(760));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(760));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(760));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(761));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(761));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(762));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(762));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(763));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(788));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(789));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(789));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(790));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(790));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(790));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(791));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(791));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(792));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(792));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(793));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(793));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(794));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(794));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(893));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(896));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(900));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(900));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(901));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(901));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(902));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(902));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(902));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(903));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(903));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(904));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(904));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(905));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(905));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(906));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(906));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(906));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(907));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(907));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(908));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(908));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(909));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(909));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 20, 28, 57, 946, DateTimeKind.Utc).AddTicks(910));

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLikes_AppUsers_AppUserId",
                table: "CommentUserLikes",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLikes_Comments_CommentId",
                table: "CommentUserLikes",
                column: "CommentId",
                principalTable: "Comments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLikes_AppUsers_AppUserId",
                table: "CommentUserLikes");

            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLikes_Comments_CommentId",
                table: "CommentUserLikes");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CommentUserLikes",
                table: "CommentUserLikes");

            migrationBuilder.RenameTable(
                name: "CommentUserLikes",
                newName: "CommentUserLike");

            migrationBuilder.RenameIndex(
                name: "IX_CommentUserLikes_CommentId",
                table: "CommentUserLike",
                newName: "IX_CommentUserLike_CommentId");

            migrationBuilder.RenameIndex(
                name: "IX_CommentUserLikes_AppUserId",
                table: "CommentUserLike",
                newName: "IX_CommentUserLike_AppUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_CommentUserLike",
                table: "CommentUserLike",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(20));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(23));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1052));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1059));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1059));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1060));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1060));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1061));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1061));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1062));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1062));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1065));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1065));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1067));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1197));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1200));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1201));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1201));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1216));

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLike_AppUsers_AppUserId",
                table: "CommentUserLike",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLike_Comments_CommentId",
                table: "CommentUserLike",
                column: "CommentId",
                principalTable: "Comments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
