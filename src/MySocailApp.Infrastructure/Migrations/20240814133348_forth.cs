using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class forth : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "UserSearch",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(1068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2076));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2076));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2177));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2180));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2236));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2236));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2238));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2238));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2242));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2242));

            migrationBuilder.CreateIndex(
                name: "IX_UserSearch_SearcherId",
                table: "UserSearch",
                column: "SearcherId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch");

            migrationBuilder.DropIndex(
                name: "IX_UserSearch_SearcherId",
                table: "UserSearch");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "UserSearch");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch",
                columns: new[] { "SearcherId", "SearchedId" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(5608));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(5611));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6708));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6711));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6711));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6713));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6713));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6714));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6714));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6717));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6717));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6718));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6718));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6719));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6719));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6720));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6720));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6721));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6721));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6722));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6722));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6723));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6881));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6884));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6885));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6885));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6885));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6886));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6886));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6887));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6888));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6888));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6889));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6889));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6889));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6890));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6890));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6891));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6891));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6892));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6892));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6893));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6893));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6894));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6895));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6896));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6896));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 16, 34, 847, DateTimeKind.Utc).AddTicks(6900));
        }
    }
}
