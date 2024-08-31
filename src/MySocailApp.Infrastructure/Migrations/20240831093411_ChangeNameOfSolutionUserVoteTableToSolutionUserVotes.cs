using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class ChangeNameOfSolutionUserVoteTableToSolutionUserVotes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserVote_Solutions_SolutionId",
                table: "SolutionUserVote");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SolutionUserVote",
                table: "SolutionUserVote");

            migrationBuilder.RenameTable(
                name: "SolutionUserVote",
                newName: "SolutionUserVotes");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserVote_SolutionId",
                table: "SolutionUserVotes",
                newName: "IX_SolutionUserVotes_SolutionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SolutionUserVotes",
                table: "SolutionUserVotes",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(301));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(308));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1333));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1336));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1336));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1337));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1337));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1338));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1338));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1339));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1339));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1340));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1340));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1341));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1341));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1341));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1342));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1342));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1343));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1343));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1344));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1344));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1345));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1345));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1346));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1446));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1449));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1449));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1450));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1450));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1451));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1451));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1452));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1452));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1453));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1453));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1454));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1454));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1454));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1455));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1455));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1456));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1456));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1457));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1457));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1458));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1458));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1458));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1459));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1459));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1460));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1460));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1461));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1461));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1461));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1462));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 31, 9, 34, 10, 851, DateTimeKind.Utc).AddTicks(1462));

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserVotes_Solutions_SolutionId",
                table: "SolutionUserVotes",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserVotes_Solutions_SolutionId",
                table: "SolutionUserVotes");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SolutionUserVotes",
                table: "SolutionUserVotes");

            migrationBuilder.RenameTable(
                name: "SolutionUserVotes",
                newName: "SolutionUserVote");

            migrationBuilder.RenameIndex(
                name: "IX_SolutionUserVotes_SolutionId",
                table: "SolutionUserVote",
                newName: "IX_SolutionUserVote_SolutionId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_SolutionUserVote",
                table: "SolutionUserVote",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(6634));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(6637));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8019));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8022));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8022));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8023));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8023));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8024));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8025));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8025));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8026));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8026));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8027));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8027));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8028));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8028));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8029));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8029));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8030));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8031));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8031));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8032));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8032));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8033));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8154));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8158));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8158));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8159));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8159));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8160));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8160));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8161));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8162));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8162));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8163));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8163));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8164));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8164));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8165));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8165));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8166));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8166));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8167));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8167));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8168));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8169));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8169));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8170));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8170));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8171));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8171));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8172));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8172));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8173));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8174));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 30, 21, 4, 39, 455, DateTimeKind.Utc).AddTicks(8174));

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserVote_Solutions_SolutionId",
                table: "SolutionUserVote",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
