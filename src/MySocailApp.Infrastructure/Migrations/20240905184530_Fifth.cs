using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Fifth : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SolutionDownvoteNotification");

            migrationBuilder.DropTable(
                name: "SolutionUpvoteNotification");

            migrationBuilder.CreateTable(
                name: "SolutionVoteNotification",
                columns: table => new
                {
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionVoteNotification", x => new { x.SolutionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_SolutionVoteNotification_Solutions_SolutionId",
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
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(2026));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(2029));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3076));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3077));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3077));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3078));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3078));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3079));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3079));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3080));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3080));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3081));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3081));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3081));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3082));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3082));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3083));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3083));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3084));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3084));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3085));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3085));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3085));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3086));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3242));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3242));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3243));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3243));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3244));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3244));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3244));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3245));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3245));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3246));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3246));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3247));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3247));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3248));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3248));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3248));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3249));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3249));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3250));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3250));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3251));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3251));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3251));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3252));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3252));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 18, 45, 30, 153, DateTimeKind.Utc).AddTicks(3253));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SolutionVoteNotification");

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
    }
}
