using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateSolutionUserSave : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SolutionUserSave",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionUserSave", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SolutionUserSave_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SolutionUserSave_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(776));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(780));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1843));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1846));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1847));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1847));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1848));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1848));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1849));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1849));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1849));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1850));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1850));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1851));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1851));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1852));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1852));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1853));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1853));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1854));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1854));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1854));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1855));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1855));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1856));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1968));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1971));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1971));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1972));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1972));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1972));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1973));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1973));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1974));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1974));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1975));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1975));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1975));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1976));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1976));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1977));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1977));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1978));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1978));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1979));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1979));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1979));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1982));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1982));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1983));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1983));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1984));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 14, 52, 21, 120, DateTimeKind.Utc).AddTicks(1984));

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserSaves_AppUserId",
                table: "QuestionUserSaves",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserSave_AppUserId",
                table: "SolutionUserSave",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserSave_SolutionId",
                table: "SolutionUserSave",
                column: "SolutionId");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserSaves_AppUsers_AppUserId",
                table: "QuestionUserSaves",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserSaves_AppUsers_AppUserId",
                table: "QuestionUserSaves");

            migrationBuilder.DropTable(
                name: "SolutionUserSave");

            migrationBuilder.DropIndex(
                name: "IX_QuestionUserSaves_AppUserId",
                table: "QuestionUserSaves");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 508, DateTimeKind.Utc).AddTicks(9895));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 508, DateTimeKind.Utc).AddTicks(9897));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(916));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(921));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(929));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(930));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(930));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(931));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(931));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(932));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1042));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1042));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1043));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1043));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1044));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1044));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1045));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1045));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1045));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1046));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1047));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1082));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1083));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1083));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1084));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1084));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1085));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1085));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1085));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1086));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 12, 35, 34, 509, DateTimeKind.Utc).AddTicks(1086));
        }
    }
}
