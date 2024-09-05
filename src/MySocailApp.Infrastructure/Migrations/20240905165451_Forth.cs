using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Forth : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SolutionDownvoteNotification",
                columns: table => new
                {
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionDownvoteNotification", x => new { x.SolutionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_SolutionDownvoteNotification_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SolutionUpvoteNotification",
                columns: table => new
                {
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionUpvoteNotification", x => new { x.SolutionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_SolutionUpvoteNotification_Solutions_SolutionId",
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
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(6512));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(6515));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7801));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7811));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7811));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7812));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7812));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7813));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7813));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7814));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7814));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7947));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(7954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8124));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8124));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8125));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8125));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8126));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8126));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8127));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8127));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8128));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8128));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8129));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8129));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8130));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8130));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8131));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8131));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8131));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8132));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8132));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8133));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8134));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8134));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 16, 54, 51, 184, DateTimeKind.Utc).AddTicks(8134));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SolutionDownvoteNotification");

            migrationBuilder.DropTable(
                name: "SolutionUpvoteNotification");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(4883));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(4886));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5916));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5919));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5919));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5921));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5928));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6077));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6079));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6079));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6080));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6080));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6081));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6081));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6082));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6082));
        }
    }
}
