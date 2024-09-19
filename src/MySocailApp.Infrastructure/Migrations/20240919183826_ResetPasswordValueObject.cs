using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ResetPasswordValueObject : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "ResetPasswordToken_ExpirationAt",
                table: "AspNetUsers",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ResetPasswordToken_NumberOfFailedAttemps",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ResetPasswordToken_Token",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(97));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(99));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1120));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1123));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1123));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1124));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1125));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1125));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1126));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1126));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1127));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1127));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1128));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1128));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1129));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1130));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1130));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1131));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1133));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1134));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1136));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1137));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1137));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1138));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1138));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1251));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1255));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1255));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1256));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1256));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1257));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1279));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1279));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1280));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1282));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1282));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1282));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1283));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1283));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1285));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1287));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1288));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1290));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1290));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1291));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1291));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1292));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1292));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1293));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1293));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1293));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1294));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1294));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1295));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1295));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1296));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 19, 18, 38, 26, 341, DateTimeKind.Utc).AddTicks(1296));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ResetPasswordToken_ExpirationAt",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "ResetPasswordToken_NumberOfFailedAttemps",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "ResetPasswordToken_Token",
                table: "AspNetUsers");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(3891));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(3895));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4876));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4879));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4880));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4880));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4880));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4881));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4881));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4882));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4882));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4883));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4883));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4884));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4884));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4884));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4885));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4888));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(4927));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5025));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5029));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5029));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5030));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5030));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5040));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5041));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 18, 9, 48, 32, 936, DateTimeKind.Utc).AddTicks(5041));
        }
    }
}
