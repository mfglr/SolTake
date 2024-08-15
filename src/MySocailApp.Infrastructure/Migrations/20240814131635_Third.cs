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
            migrationBuilder.CreateTable(
                name: "UserSearch",
                columns: table => new
                {
                    SearcherId = table.Column<int>(type: "int", nullable: false),
                    SearchedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserSearch", x => new { x.SearcherId, x.SearchedId });
                    table.ForeignKey(
                        name: "FK_UserSearch_AppUsers_SearchedId",
                        column: x => x.SearchedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_UserSearch_AppUsers_SearcherId",
                        column: x => x.SearcherId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

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

            migrationBuilder.CreateIndex(
                name: "IX_UserSearch_SearchedId",
                table: "UserSearch",
                column: "SearchedId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserSearch");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(7506));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8653));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8655));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8656));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8656));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8657));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8657));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8658));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8658));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8659));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8659));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8660));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8660));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8661));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8661));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8662));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8662));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8663));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8663));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8664));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8664));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8665));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8665));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8666));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8886));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8889));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8890));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8890));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8891));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8891));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8892));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8892));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8893));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8893));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8894));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8894));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8894));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8895));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8895));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8896));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8896));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8897));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8898));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8899));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8900));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8900));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8901));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8901));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8902));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8902));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8903));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8903));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 12, 9, 19, 56, 300, DateTimeKind.Utc).AddTicks(8904));
        }
    }
}
