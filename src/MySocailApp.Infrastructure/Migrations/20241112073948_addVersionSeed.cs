using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addVersionSeed : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Versions",
                columns: new[] { "Id", "Code", "CreatedAt", "IsUpgradeRequired" },
                values: new object[,]
                {
                    { 1, 1, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 2, 2, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 3, 3, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 4, 4, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 5, 5, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 6, 6, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 7, 7, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 8, 8, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 9, 9, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 10, 10, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 11, 11, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 12, 12, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 13, 13, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true },
                    { 14, 14, new DateTime(2024, 11, 12, 7, 36, 19, 815, DateTimeKind.Unspecified).AddTicks(6688), true }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 11);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 12);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 13);

            migrationBuilder.DeleteData(
                table: "Versions",
                keyColumn: "Id",
                keyValue: 14);
        }
    }
}
