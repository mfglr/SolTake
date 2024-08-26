using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Third : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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
                newName: "QuestionUserLikes");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionLikes_QuestionId",
                table: "QuestionUserLikes",
                newName: "IX_QuestionUserLikes_QuestionId");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionLikes_AppUserId",
                table: "QuestionUserLikes",
                newName: "IX_QuestionUserLikes_AppUserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserLikes",
                table: "QuestionUserLikes",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(4171));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(4176));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5414));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5417));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5417));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5418));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5418));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5419));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5419));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5420));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5420));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5421));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5421));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5422));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5422));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5423));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5423));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5424));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5424));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5425));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5425));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5425));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5426));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5426));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5427));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5535));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5537));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5538));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5538));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5539));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5539));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5540));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5540));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5541));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5541));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5542));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5542));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5543));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5543));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5544));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5544));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5545));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5545));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5546));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5546));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5547));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5547));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5548));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5548));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5549));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5549));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5550));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5550));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5551));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5551));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5552));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 4, 25, 629, DateTimeKind.Utc).AddTicks(5552));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLikes_AppUsers_AppUserId",
                table: "QuestionUserLikes",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLikes_Questions_QuestionId",
                table: "QuestionUserLikes",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLikes_AppUsers_AppUserId",
                table: "QuestionUserLikes");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLikes_Questions_QuestionId",
                table: "QuestionUserLikes");

            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserLikes",
                table: "QuestionUserLikes");

            migrationBuilder.RenameTable(
                name: "QuestionUserLikes",
                newName: "QuestionLikes");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserLikes_QuestionId",
                table: "QuestionLikes",
                newName: "IX_QuestionLikes_QuestionId");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserLikes_AppUserId",
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
    }
}
