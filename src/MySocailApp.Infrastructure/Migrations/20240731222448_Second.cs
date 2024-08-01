using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Second : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DateOfLastCreatedMessage",
                table: "Conversations",
                newName: "LastMessageCreatedAt");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(4863));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(4866));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5799));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5802));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5802));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5803));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5803));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5811));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5811));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5947));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5949));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5960));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5960));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5962));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5962));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5963));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "LastMessageCreatedAt",
                table: "Conversations",
                newName: "DateOfLastCreatedMessage");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(1616));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(1619));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2833));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2836));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2837));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2838));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2838));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2839));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2839));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2840));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2840));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2841));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2841));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2842));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2842));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2843));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2843));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2844));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2844));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2845));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2845));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2846));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2846));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2847));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(2847));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3042));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3042));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3044));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3044));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3045));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3045));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3046));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3046));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3047));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3047));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3048));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3048));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3049));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3049));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3050));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3050));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3051));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3051));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3052));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3052));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3053));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3053));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3054));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3054));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 21, 7, 54, 366, DateTimeKind.Utc).AddTicks(3055));
        }
    }
}
