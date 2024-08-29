using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Test8 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropCheckConstraint(
                name: "CK_Follow_FollowerId_NotEqual_FollowedId",
                table: "Follows");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(2602));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(2604));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3625));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3628));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3629));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3629));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3630));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3630));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3631));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3632));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3632));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3633));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3634));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3636));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3637));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3638));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3638));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3639));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3639));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3640));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3640));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3641));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3641));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3642));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3642));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3744));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3747));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3747));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3748));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3748));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3749));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3749));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3749));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3750));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3750));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3751));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3751));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3754));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3755));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3755));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3755));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3756));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3756));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3757));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3758));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3808));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3809));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3809));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3809));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3810));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3810));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3811));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3811));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3812));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3812));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3813));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 8, 36, 80, DateTimeKind.Utc).AddTicks(3813));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(4118));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(4120));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5209));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5211));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5212));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5213));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5213));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5213));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5214));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5214));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5215));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5215));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5216));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5217));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5217));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5218));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5219));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5220));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5221));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5326));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5329));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5329));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5330));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5330));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5331));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5331));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5332));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5332));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5333));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5333));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5334));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5334));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5334));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5335));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5338));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5338));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5339));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5340));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5340));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5341));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5341));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5341));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5342));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5342));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5343));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5344));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5344));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5345));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 29, 19, 4, 51, 849, DateTimeKind.Utc).AddTicks(5345));

            migrationBuilder.AddCheckConstraint(
                name: "CK_Follow_FollowerId_NotEqual_FollowedId",
                table: "Follows",
                sql: "[FollowerId] <> [FollowedId]");
        }
    }
}
