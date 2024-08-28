using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Test : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Follow_AppUsers_FollowedId",
                table: "Follow");

            migrationBuilder.DropForeignKey(
                name: "FK_Follow_AppUsers_FollowerId",
                table: "Follow");

            migrationBuilder.DropTable(
                name: "Block");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Follow",
                table: "Follow");

            migrationBuilder.DropColumn(
                name: "IsRemoved",
                table: "AppUsers");

            migrationBuilder.DropColumn(
                name: "RemovedAt",
                table: "AppUsers");

            migrationBuilder.DropColumn(
                name: "IsRemoved",
                table: "Follow");

            migrationBuilder.RenameTable(
                name: "Follow",
                newName: "Follows");

            migrationBuilder.RenameColumn(
                name: "RemovedAt",
                table: "Follows",
                newName: "UpdatedAt");

            migrationBuilder.RenameIndex(
                name: "IX_Follow_FollowedId",
                table: "Follows",
                newName: "IX_Follows_FollowedId");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "Follows",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Follows",
                table: "Follows",
                column: "Id");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(20));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(23));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1052));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1057));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1058));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1059));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1059));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1060));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1060));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1061));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1061));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1062));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1062));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1063));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1064));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1065));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1065));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1066));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1067));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1067));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1197));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1200));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1201));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1201));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 28, 8, 43, 46, 67, DateTimeKind.Utc).AddTicks(1216));

            migrationBuilder.CreateIndex(
                name: "IX_Follows_FollowerId",
                table: "Follows",
                column: "FollowerId");

            migrationBuilder.AddForeignKey(
                name: "FK_Follows_AppUsers_FollowedId",
                table: "Follows",
                column: "FollowedId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows",
                column: "FollowerId",
                principalTable: "AppUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Follows_AppUsers_FollowedId",
                table: "Follows");

            migrationBuilder.DropForeignKey(
                name: "FK_Follows_AppUsers_FollowerId",
                table: "Follows");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Follows",
                table: "Follows");

            migrationBuilder.DropIndex(
                name: "IX_Follows_FollowerId",
                table: "Follows");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Follows");

            migrationBuilder.RenameTable(
                name: "Follows",
                newName: "Follow");

            migrationBuilder.RenameColumn(
                name: "UpdatedAt",
                table: "Follow",
                newName: "RemovedAt");

            migrationBuilder.RenameIndex(
                name: "IX_Follows_FollowedId",
                table: "Follow",
                newName: "IX_Follow_FollowedId");

            migrationBuilder.AddColumn<bool>(
                name: "IsRemoved",
                table: "AppUsers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "RemovedAt",
                table: "AppUsers",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsRemoved",
                table: "Follow",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Follow",
                table: "Follow",
                columns: new[] { "FollowerId", "FollowedId" });

            migrationBuilder.CreateTable(
                name: "Block",
                columns: table => new
                {
                    BlockerId = table.Column<int>(type: "int", nullable: false),
                    BlockedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Block", x => new { x.BlockerId, x.BlockedId });
                    table.ForeignKey(
                        name: "FK_Block_AppUsers_BlockedId",
                        column: x => x.BlockedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Block_AppUsers_BlockerId",
                        column: x => x.BlockerId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(7855));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(7858));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8950));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8953));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8954));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8956));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8956));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8956));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8957));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8957));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8958));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(8958));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9033));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9033));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9035));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9036));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9037));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9039));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9039));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9041));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9042));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9044));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9045));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9046));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9047));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9158));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9160));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9201));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9202));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9203));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9204));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9205));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9206));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9207));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9216));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9220));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9220));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9222));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9224));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 27, 15, 34, 1, 729, DateTimeKind.Utc).AddTicks(9224));

            migrationBuilder.CreateIndex(
                name: "IX_Block_BlockedId",
                table: "Block",
                column: "BlockedId");

            migrationBuilder.AddForeignKey(
                name: "FK_Follow_AppUsers_FollowedId",
                table: "Follow",
                column: "FollowedId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Follow_AppUsers_FollowerId",
                table: "Follow",
                column: "FollowerId",
                principalTable: "AppUsers",
                principalColumn: "Id");
        }
    }
}
