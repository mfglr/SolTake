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
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionImage_Questions_QuestionId",
                table: "QuestionImage");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionTopic_Questions_QuestionId",
                table: "QuestionTopic");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike");

            migrationBuilder.DropForeignKey(
                name: "FK_SolutionImage_Solutions_SolutionId",
                table: "SolutionImage");

            migrationBuilder.DropForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "SolvedAt",
                table: "Questions");

            migrationBuilder.DropColumn(
                name: "State",
                table: "Questions");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(2279));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(2282));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3410));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3414));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3414));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3415));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3415));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3416));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3416));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3417));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3417));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3418));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3418));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3419));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3419));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3420));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3420));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3421));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3421));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3422));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3422));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3423));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3423));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3424));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3424));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3520));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3523));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3524));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3524));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3526));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3527));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3527));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3528));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3528));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3528));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3529));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3529));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3530));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3530));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3531));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3531));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3532));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3532));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3533));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3533));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3534));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3534));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3534));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3535));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3535));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3536));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3572));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3573));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 23, 10, 53, 41, 174, DateTimeKind.Utc).AddTicks(3573));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionImage_Questions_QuestionId",
                table: "QuestionImage",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionTopic_Questions_QuestionId",
                table: "QuestionTopic",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionImage_Solutions_SolutionId",
                table: "SolutionImage",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionImage_Questions_QuestionId",
                table: "QuestionImage");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionTopic_Questions_QuestionId",
                table: "QuestionTopic");

            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike");

            migrationBuilder.DropForeignKey(
                name: "FK_SolutionImage_Solutions_SolutionId",
                table: "SolutionImage");

            migrationBuilder.DropForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions");

            migrationBuilder.AddColumn<DateTime>(
                name: "SolvedAt",
                table: "Questions",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "State",
                table: "Questions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(398));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(401));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1391));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1394));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1394));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1395));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1395));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1396));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1396));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1397));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1397));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1398));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1398));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1399));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1399));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1399));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1400));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1400));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1401));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1401));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1402));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1402));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1402));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1403));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1403));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1510));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1512));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1513));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1513));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1514));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1514));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1515));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1515));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1515));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1516));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1516));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1517));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1517));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1518));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1518));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1519));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1519));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1520));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1520));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1521));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1521));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1521));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1522));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1522));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1523));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1523));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1524));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1524));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1525));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 22, 14, 51, 7, 943, DateTimeKind.Utc).AddTicks(1526));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionImage_Questions_QuestionId",
                table: "QuestionImage",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionTopic_Questions_QuestionId",
                table: "QuestionTopic",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserLike_Questions_QuestionId",
                table: "QuestionUserLike",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionImage_Solutions_SolutionId",
                table: "SolutionImage",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Solutions_Questions_QuestionId",
                table: "Solutions",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id");
        }
    }
}
