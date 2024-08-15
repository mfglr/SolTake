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
                name: "FollowRequest");

            migrationBuilder.DropColumn(
                name: "ProfileVisibility",
                table: "AppUsers");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(1962));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(1966));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3598));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3602));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3602));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3603));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3603));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3604));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(3604));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4386));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4388));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4388));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4389));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4389));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4390));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4390));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4391));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4391));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4392));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4392));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4393));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4393));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4393));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4394));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4394));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4541));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4544));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4544));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4545));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4545));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4546));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4546));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4547));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4547));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4548));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4548));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4549));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4549));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4550));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4550));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4551));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4551));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4552));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4552));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4553));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4553));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4554));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4554));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4554));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4555));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4555));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4556));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4556));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4557));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4557));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4558));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 17, 40, 23, 267, DateTimeKind.Utc).AddTicks(4558));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ProfileVisibility",
                table: "AppUsers",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "FollowRequest",
                columns: table => new
                {
                    RequesterId = table.Column<int>(type: "int", nullable: false),
                    RequestedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FollowRequest", x => new { x.RequesterId, x.RequestedId });
                    table.ForeignKey(
                        name: "FK_FollowRequest_AppUsers_RequestedId",
                        column: x => x.RequestedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_FollowRequest_AppUsers_RequesterId",
                        column: x => x.RequesterId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(1068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2068));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2069));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2070));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2071));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2072));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2073));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2074));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2075));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2076));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2076));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2177));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2180));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2236));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2236));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2237));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2238));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2238));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2239));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2240));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2241));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2242));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 13, 33, 47, 952, DateTimeKind.Utc).AddTicks(2242));

            migrationBuilder.CreateIndex(
                name: "IX_FollowRequest_RequestedId",
                table: "FollowRequest",
                column: "RequestedId");
        }
    }
}
