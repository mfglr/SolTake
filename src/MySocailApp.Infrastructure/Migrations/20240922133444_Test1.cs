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
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(52));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(59));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1172));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1176));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1176));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1177));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1177));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1178));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1178));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1179));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1179));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1180));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1180));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1180));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1181));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1181));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1182));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1182));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1183));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1183));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1184));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1184));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1185));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1185));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1297));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1300));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1300));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1301));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1301));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1302));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1302));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1303));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1304));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1305));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1310));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1311));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1313));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1314));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1314));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1315));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1315));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1315));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1316));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1316));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1317));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1319));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1319));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1320));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1321));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1321));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1323));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1325));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1325));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1325));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1326));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 22, 13, 34, 44, 456, DateTimeKind.Utc).AddTicks(1327));

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
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

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
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
