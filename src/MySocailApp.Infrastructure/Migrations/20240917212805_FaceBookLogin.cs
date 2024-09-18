using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class FaceBookLogin : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "EmailConfirmationToken_Token",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<int>(
                name: "EmailConfirmationToken_NumberOfFailedAttemps",
                table: "AspNetUsers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<DateTime>(
                name: "EmailConfirmationToken_ExpirationAt",
                table: "AspNetUsers",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<bool>(
                name: "IsThirdPartyAuthenticated",
                table: "AspNetUsers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(8042));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(8053));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9332));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9336));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9336));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9337));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9337));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9337));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9338));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9338));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9339));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9339));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9340));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9340));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9341));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9385));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9385));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9386));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9386));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9387));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9387));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9388));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9388));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9388));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9389));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9502));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9505));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9505));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9506));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9506));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9507));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9507));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9507));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9508));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9508));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9509));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9509));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9510));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9510));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9511));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9511));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9511));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9512));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9512));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9513));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9513));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9514));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9514));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9515));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9515));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9516));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9516));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9516));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9517));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9517));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9518));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 17, 21, 28, 5, 201, DateTimeKind.Utc).AddTicks(9518));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsThirdPartyAuthenticated",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<string>(
                name: "EmailConfirmationToken_Token",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "EmailConfirmationToken_NumberOfFailedAttemps",
                table: "AspNetUsers",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "EmailConfirmationToken_ExpirationAt",
                table: "AspNetUsers",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(1831));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(1834));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3064));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3076));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3076));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3077));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3077));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3078));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3200));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3215));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3216));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3216));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3218));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3218));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 22, 3, 39, 448, DateTimeKind.Utc).AddTicks(3219));
        }
    }
}
