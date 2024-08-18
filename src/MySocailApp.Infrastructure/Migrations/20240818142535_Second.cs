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
            migrationBuilder.DropColumn(
                name: "ParentType",
                table: "Notifications");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(7776));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(7779));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8737));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8740));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8741));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8741));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8742));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8742));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8743));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8743));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8743));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8744));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8744));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8745));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8745));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8746));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8746));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8746));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8747));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8747));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8748));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8748));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8749));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8749));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8750));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8847));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8849));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8850));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8850));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8851));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8851));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8852));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8852));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8853));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8853));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8854));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8854));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8855));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8855));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8856));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8856));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8857));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8857));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8857));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8858));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8858));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8859));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8859));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8860));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8860));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8860));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8861));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8861));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8862));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8862));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8863));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 14, 25, 35, 520, DateTimeKind.Utc).AddTicks(8863));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ParentType",
                table: "Notifications",
                type: "int",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(3668));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(3673));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4929));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4929));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4930));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4930));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4931));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4931));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4932));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4932));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4933));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4933));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4934));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4934));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4935));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(4935));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5052));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5055));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5056));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5056));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5057));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5057));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5058));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5058));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5059));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5059));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5060));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5060));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5061));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5061));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5062));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5062));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5062));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5063));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5063));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5064));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5064));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5065));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5065));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5066));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5066));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5067));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5067));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5068));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5068));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5068));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5069));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 18, 9, 17, 52, 920, DateTimeKind.Utc).AddTicks(5069));
        }
    }
}
