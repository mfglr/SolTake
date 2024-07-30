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
            migrationBuilder.AddColumn<int>(
                name: "QuestionId",
                table: "Notifications",
                type: "int",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(2506));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(2509));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3812));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3812));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3813));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3813));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3814));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3814));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3815));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3815));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3816));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3816));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3817));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3817));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3818));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3818));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3848));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3849));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3849));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3850));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3850));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3850));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3851));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3851));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3965));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3967));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3968));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3968));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3969));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3969));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3970));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3970));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3971));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3971));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3972));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3972));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3973));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3973));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3974));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3974));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3975));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3975));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3976));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3976));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3977));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3977));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3978));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3978));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3979));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3979));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3982));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 18, 30, 3, 12, DateTimeKind.Utc).AddTicks(3982));

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_OwnerId",
                table: "Notifications",
                column: "OwnerId");

            migrationBuilder.AddForeignKey(
                name: "FK_Notifications_AppUsers_OwnerId",
                table: "Notifications",
                column: "OwnerId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Notifications_AppUsers_OwnerId",
                table: "Notifications");

            migrationBuilder.DropIndex(
                name: "IX_Notifications_OwnerId",
                table: "Notifications");

            migrationBuilder.DropColumn(
                name: "QuestionId",
                table: "Notifications");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(8184));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(8187));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9224));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9227));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9227));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9228));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9228));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9229));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9229));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9230));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9230));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9231));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9231));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9231));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9232));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9232));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9233));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9233));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9234));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9234));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9235));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9235));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9236));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9236));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9331));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9334));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9335));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9335));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9335));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9336));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9336));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9337));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9337));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9338));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9338));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9339));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9339));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9339));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9340));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9340));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9341));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9341));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9342));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9342));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9344));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9344));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9345));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9345));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9346));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9346));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9346));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9347));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 29, 9, 20, 35, 593, DateTimeKind.Utc).AddTicks(9347));
        }
    }
}
