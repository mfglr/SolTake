using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeNameOfQuestionUserSaveTableToQuestionUserSaves : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserSave_Questions_QuestionId",
                table: "QuestionUserSave");

            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserSave",
                table: "QuestionUserSave");

            migrationBuilder.RenameTable(
                name: "QuestionUserSave",
                newName: "QuestionUserSaves");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserSave_QuestionId",
                table: "QuestionUserSaves",
                newName: "IX_QuestionUserSaves_QuestionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserSaves",
                table: "QuestionUserSaves",
                column: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserSaves_Questions_QuestionId",
                table: "QuestionUserSaves",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserSaves_Questions_QuestionId",
                table: "QuestionUserSaves");

            migrationBuilder.DropPrimaryKey(
                name: "PK_QuestionUserSaves",
                table: "QuestionUserSaves");

            migrationBuilder.RenameTable(
                name: "QuestionUserSaves",
                newName: "QuestionUserSave");

            migrationBuilder.RenameIndex(
                name: "IX_QuestionUserSaves_QuestionId",
                table: "QuestionUserSave",
                newName: "IX_QuestionUserSave_QuestionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_QuestionUserSave",
                table: "QuestionUserSave",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(5562));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(5565));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7046));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7049));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7050));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7050));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7051));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7051));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7052));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7052));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7053));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7053));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7054));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7054));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7055));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7055));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7055));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7056));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7056));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7059));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7059));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7177));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7180));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7180));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7181));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7182));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7183));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7184));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7185));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7186));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7187));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7188));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7188));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7189));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7189));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7190));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7190));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7191));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7191));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7192));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7192));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7193));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7193));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7193));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 16, 21, 36, 39, 10, DateTimeKind.Utc).AddTicks(7194));

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserSave_Questions_QuestionId",
                table: "QuestionUserSave",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
