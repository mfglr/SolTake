using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class sixth : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSearch_AppUsers_SearchedId",
                table: "UserSearch");

            migrationBuilder.DropForeignKey(
                name: "FK_UserSearch_AppUsers_SearcherId",
                table: "UserSearch");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch");

            migrationBuilder.RenameTable(
                name: "UserSearch",
                newName: "UserSearchs");

            migrationBuilder.RenameIndex(
                name: "IX_UserSearch_SearcherId",
                table: "UserSearchs",
                newName: "IX_UserSearchs_SearcherId");

            migrationBuilder.RenameIndex(
                name: "IX_UserSearch_SearchedId",
                table: "UserSearchs",
                newName: "IX_UserSearchs_SearchedId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserSearchs",
                table: "UserSearchs",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(6427));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(6429));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7444));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7446));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7447));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7447));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7448));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7448));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7449));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7449));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7450));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7450));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7450));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7451));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7451));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7452));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7452));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7453));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7453));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7454));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7454));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7454));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7455));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7455));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7456));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7567));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7569));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7570));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7570));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7571));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7571));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7572));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7572));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7573));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7573));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7574));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7574));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7574));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7575));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7575));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7576));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7576));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7576));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7577));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7577));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7578));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7578));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7579));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7579));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7579));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7580));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7580));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7581));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7581));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7582));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7584));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 14, 18, 42, 2, 459, DateTimeKind.Utc).AddTicks(7584));

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs",
                column: "SearchedId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearchs_AppUsers_SearcherId",
                table: "UserSearchs",
                column: "SearcherId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSearchs_AppUsers_SearchedId",
                table: "UserSearchs");

            migrationBuilder.DropForeignKey(
                name: "FK_UserSearchs_AppUsers_SearcherId",
                table: "UserSearchs");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserSearchs",
                table: "UserSearchs");

            migrationBuilder.RenameTable(
                name: "UserSearchs",
                newName: "UserSearch");

            migrationBuilder.RenameIndex(
                name: "IX_UserSearchs_SearcherId",
                table: "UserSearch",
                newName: "IX_UserSearch_SearcherId");

            migrationBuilder.RenameIndex(
                name: "IX_UserSearchs_SearchedId",
                table: "UserSearch",
                newName: "IX_UserSearch_SearchedId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserSearch",
                table: "UserSearch",
                column: "Id");

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

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearch_AppUsers_SearchedId",
                table: "UserSearch",
                column: "SearchedId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSearch_AppUsers_SearcherId",
                table: "UserSearch",
                column: "SearcherId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
