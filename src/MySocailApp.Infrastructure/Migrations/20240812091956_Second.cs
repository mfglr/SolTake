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
            migrationBuilder.AddColumn<bool>(
                name: "HasImage",
                table: "AppUsers",
                type: "bit",
                nullable: false,
                defaultValue: false);

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "HasImage",
                table: "AppUsers");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(3704));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(3709));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4725));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4728));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4728));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4729));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4729));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4730));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4730));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4731));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4731));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4732));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4732));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4733));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4733));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4734));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4734));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4735));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4735));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4736));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4736));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4737));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4737));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4737));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4738));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4860));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4863));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4863));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4864));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4864));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4864));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4865));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4865));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4866));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4866));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4867));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4867));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4868));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4868));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4869));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4869));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4870));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4870));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4871));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4871));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4872));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4872));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4873));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4873));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4874));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4874));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4875));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4875));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4876));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4876));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4877));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 11, 22, 11, 35, 592, DateTimeKind.Utc).AddTicks(4877));
        }
    }
}
