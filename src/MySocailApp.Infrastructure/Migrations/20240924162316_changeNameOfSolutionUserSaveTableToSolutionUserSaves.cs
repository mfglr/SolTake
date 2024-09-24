using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class changeNameOfSolutionUserSaveTableToSolutionUserSaves : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserSave_AppUsers_AppUserId",
                table: "SolutionUserSave");

            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserSave_Solutions_SolutionId",
                table: "SolutionUserSave");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SolutionUserSave",
                table: "SolutionUserSave");

            migrationBuilder.RenameTable(
                name: "SolutionUserSave",
                newName: "SolutionUserSaves");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserSave_SolutionId",
                table: "SolutionUserSaves",
                newName: "IX_SolutionUserSaves_SolutionId");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserSave_AppUserId",
                table: "SolutionUserSaves",
                newName: "IX_SolutionUserSaves_AppUserId");

            migrationBuilder.AlterColumn<string>(
                name: "Content_Value",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_SolutionUserSaves",
                table: "SolutionUserSaves",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(1861));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(1864));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2905));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2908));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2908));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2909));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2909));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2910));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2910));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2910));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2911));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2911));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2912));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2912));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2913));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2913));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2914));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2914));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2915));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2915));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2915));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2916));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2916));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2917));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(2917));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3019));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3022));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3022));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3023));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3023));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3024));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3024));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3025));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3025));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3025));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3026));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3026));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3027));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3027));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3029));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3029));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3030));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3030));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3030));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 24, 16, 23, 16, 109, DateTimeKind.Utc).AddTicks(3035));

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserSaves_AppUsers_AppUserId",
                table: "SolutionUserSaves",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserSaves_Solutions_SolutionId",
                table: "SolutionUserSaves",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserSaves_AppUsers_AppUserId",
                table: "SolutionUserSaves");

            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserSaves_Solutions_SolutionId",
                table: "SolutionUserSaves");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SolutionUserSaves",
                table: "SolutionUserSaves");

            migrationBuilder.RenameTable(
                name: "SolutionUserSaves",
                newName: "SolutionUserSave");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserSaves_SolutionId",
                table: "SolutionUserSave",
                newName: "IX_SolutionUserSave_SolutionId");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserSaves_AppUserId",
                table: "SolutionUserSave",
                newName: "IX_SolutionUserSave_AppUserId");

            migrationBuilder.AlterColumn<string>(
                name: "Content_Value",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SolutionUserSave",
                table: "SolutionUserSave",
                column: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserSave_AppUsers_AppUserId",
                table: "SolutionUserSave",
                column: "AppUserId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserSave_Solutions_SolutionId",
                table: "SolutionUserSave",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
