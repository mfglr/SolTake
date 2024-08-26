using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Thir : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLike_AppUsers_AppUserId",
                table: "QuestionUserLike");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike");

            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike");

            migrationBuilder.RenameTable(
                name: "QuestionUserLike",
                newName: "QuestionLikes");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserLike_QuestionId",
                table: "QuestionLikes",
                newName: "IX_QuestionLikes_QuestionId");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserLike_AppUserId",
                table: "QuestionLikes",
                newName: "IX_QuestionLikes_AppUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionLikes",
                table: "QuestionLikes",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 385, DateTimeKind.Utc).AddTicks(9593));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 385, DateTimeKind.Utc).AddTicks(9597));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(592));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(595));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(595));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(596));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(596));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(597));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(597));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(598));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(598));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(599));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(599));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(599));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(600));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(600));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(601));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(601));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(602));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(602));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(603));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(603));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(603));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(604));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(604));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(740));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(743));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(743));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(743));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(744));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(744));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(745));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(745));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(746));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(746));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(746));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(747));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(747));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(748));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(748));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(749));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(749));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(750));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(750));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(751));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(751));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(751));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(752));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(752));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(753));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(753));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(754));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(754));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(755));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(755));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(756));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 3, 24, 386, DateTimeKind.Utc).AddTicks(756));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionLikes_AppUsers_AppUserId",
                table: "QuestionLikes",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionLikes_Questions_QuestionId",
                table: "QuestionLikes",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionLikes_AppUsers_AppUserId",
                table: "QuestionLikes");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionLikes_Questions_QuestionId",
                table: "QuestionLikes");

            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionLikes",
                table: "QuestionLikes");

            migrationBuilder.RenameTable(
                name: "QuestionLikes",
                newName: "QuestionUserLike");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionLikes_QuestionId",
                table: "QuestionUserLike",
                newName: "IX_QuestionUserLike_QuestionId");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionLikes_AppUserId",
                table: "QuestionUserLike",
                newName: "IX_QuestionUserLike_AppUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(6251));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(6254));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7367));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7370));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7370));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7371));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7371));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7372));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7372));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7373));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7381));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7487));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7496));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7496));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7499));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7499));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7502));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7503));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7503));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7504));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7504));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7505));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7505));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLike_AppUsers_AppUserId",
                table: "QuestionUserLike",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
