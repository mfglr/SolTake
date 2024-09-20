using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateVerificationTokenValueObject : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ResetPasswordToken_Token",
                table: "AspNetUsers",
                newName: "ResetPasswordToken_TokenHash");

            migrationBuilder.RenameColumn(
                name: "EmailConfirmationToken_Token",
                table: "AspNetUsers",
                newName: "EmailConfirmationToken_TokenHash");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 880, DateTimeKind.Utc).AddTicks(8860));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 880, DateTimeKind.Utc).AddTicks(8863));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(240));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(243));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(243));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(244));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(245));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(245));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(246));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(246));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(247));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(248));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(248));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(249));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(249));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(250));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(250));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(251));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(252));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(252));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(253));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(253));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(254));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(254));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(255));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(481));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(486));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(487));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(487));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(488));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(488));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(489));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(489));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(496));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(499));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(502));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(502));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 20, 0, 9, 43, 881, DateTimeKind.Utc).AddTicks(503));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ResetPasswordToken_TokenHash",
                table: "AspNetUsers",
                newName: "ResetPasswordToken_Token");

            migrationBuilder.RenameColumn(
                name: "EmailConfirmationToken_TokenHash",
                table: "AspNetUsers",
                newName: "EmailConfirmationToken_Token");

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
    }
}
