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
                name: "FK_Questions_AppUsers_AppUserId",
                table: "Questions");

            migrationBuilder.DropForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

            migrationBuilder.AddColumn<bool>(
                name: "IsRemoved",
                table: "Comments",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 544, DateTimeKind.Utc).AddTicks(9092));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 544, DateTimeKind.Utc).AddTicks(9095));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(258));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(261));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(262));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(262));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(263));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(263));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(264));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(264));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(265));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(265));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(265));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(266));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(266));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(267));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(267));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(268));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(268));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(269));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(269));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(270));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(270));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(271));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(271));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(415));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(418));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(418));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(419));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(419));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(420));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(420));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(420));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(421));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(421));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(422));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(422));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(423));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(423));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(424));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(424));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(424));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(425));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(425));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(426));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(426));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(427));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(427));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(428));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(428));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(429));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(429));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(430));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(430));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(431));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(431));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 23, 0, 47, 30, 545, DateTimeKind.Utc).AddTicks(432));

            migrationBuilder.AddForeignKey(
                name: "FK_Questions_AppUsers_AppUserId",
                table: "Questions",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Questions_AppUsers_AppUserId",
                table: "Questions");

            migrationBuilder.DropForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "IsRemoved",
                table: "Comments");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(7484));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(7488));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8537));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8540));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8541));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8541));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8542));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8542));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8542));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8543));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8544));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8544));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8545));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8545));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8545));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8546));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8546));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8547));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8547));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8548));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8548));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8549));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8549));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8550));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8550));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8663));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8666));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8666));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8667));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8667));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8668));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8668));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8669));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8669));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8670));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8670));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8671));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8671));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8671));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8672));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8672));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8673));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8673));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8674));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8674));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8675));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8675));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8676));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8676));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8677));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8677));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8678));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8678));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8678));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8679));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8679));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 51, 36, 748, DateTimeKind.Utc).AddTicks(8680));

            migrationBuilder.AddForeignKey(
                name: "FK_Questions_AppUsers_AppUserId",
                table: "Questions",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
