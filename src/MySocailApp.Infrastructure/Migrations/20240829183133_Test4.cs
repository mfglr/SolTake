using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Test4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(6125));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(6128));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7207));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7210));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7211));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7211));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7212));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7212));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7213));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7213));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7214));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7214));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7217));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7217));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7221));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7221));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7371));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7373));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7381));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7381));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7382));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7382));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7383));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7383));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7384));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7384));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7384));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7385));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7385));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7386));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7386));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7387));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 18, 31, 32, 901, DateTimeKind.Utc).AddTicks(7387));

            migrationBuilder.AddForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows",
                column: "FollowerId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 684, DateTimeKind.Utc).AddTicks(9588));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 684, DateTimeKind.Utc).AddTicks(9590));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(707));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(711));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(711));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(712));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(713));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(713));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(714));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(714));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(715));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(715));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(716));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(716));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(717));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(717));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(717));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(718));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(718));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(719));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(719));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(720));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(720));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(828));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(831));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(832));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(832));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(833));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(833));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(834));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(834));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(834));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(835));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(835));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(836));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(836));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(837));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(837));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(838));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(838));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(838));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(839));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(839));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(840));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(840));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(841));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(841));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(842));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(842));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(844));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(844));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 13, 26, 55, 685, DateTimeKind.Utc).AddTicks(845));

            migrationBuilder.AddForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows",
                column: "FollowerId",
                principalTable: "AppUsers",
                principalColumn: "Id");
        }
    }
}
