using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateQuestionContentValueObject : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Content",
                table: "Questions",
                newName: "Content_Value");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(8626));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(8628));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9821));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9824));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9824));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9825));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9825));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9826));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9826));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9827));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9827));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9828));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9828));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9829));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9829));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9830));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9830));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9831));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9831));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9832));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9832));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9833));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9833));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9834));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9834));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9943));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9946));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9946));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9947));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9947));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9948));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9948));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9949));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9949));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9960));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 15, 19, 43, 8, 502, DateTimeKind.Utc).AddTicks(9960));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Content_Value",
                table: "Questions",
                newName: "Content");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(4095));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(4097));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5215));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5221));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5222));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5222));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5223));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5223));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5224));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5224));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5225));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5225));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5226));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5226));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5227));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5227));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5228));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5228));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(5229));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6176));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6178));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6178));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6179));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6179));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6180));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6188));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6188));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6189));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6189));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6190));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6190));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6191));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6192));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6192));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6192));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6193));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 13, 19, 25, 34, 56, DateTimeKind.Utc).AddTicks(6193));
        }
    }
}
