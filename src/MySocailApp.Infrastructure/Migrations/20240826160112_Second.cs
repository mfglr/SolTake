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
            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "QuestionUserLike",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(6251));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(6254));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7367));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7370));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7370));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7371));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7371));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7372));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7372));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7373));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7374));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7375));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7376));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7377));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7378));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7379));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7381));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7487));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7490));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7491));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7493));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7494));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7495));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7496));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7496));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7497));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7498));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7499));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7499));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7500));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7502));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7503));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7503));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7504));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7504));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7505));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 26, 16, 1, 12, 132, DateTimeKind.Utc).AddTicks(7505));

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserLike_QuestionId",
                table: "QuestionUserLike",
                column: "QuestionId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike");

            migrationBuilder.DropIndex(
                name: "IX_QuestionUserLike_QuestionId",
                table: "QuestionUserLike");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "QuestionUserLike");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserLike",
                table: "QuestionUserLike",
                columns: new[] { "QuestionId", "AppUserId" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(5428));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(5430));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6479));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6482));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6483));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6483));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6484));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6484));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6485));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6485));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6486));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6486));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6487));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6487));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6487));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6488));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6488));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6489));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6489));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6490));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6490));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6491));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6491));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6492));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6492));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6588));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6590));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6591));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6591));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6592));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6592));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6593));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6593));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6594));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6594));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6595));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6595));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6595));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6596));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6596));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6597));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6597));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6598));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6598));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6599));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6599));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6600));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6600));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6601));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6601));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6602));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6602));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6603));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6603));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6603));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6604));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 25, 16, 50, 21, 774, DateTimeKind.Utc).AddTicks(6604));
        }
    }
}
