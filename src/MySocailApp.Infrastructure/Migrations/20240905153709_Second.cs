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
            migrationBuilder.DropColumn(
                name: "IsRemoved",
                table: "CommentUserLikes");

            migrationBuilder.DropColumn(
                name: "RemovedAt",
                table: "CommentUserLikes");

            migrationBuilder.CreateTable(
                name: "CommentLikeNotification",
                columns: table => new
                {
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentLikeNotification", x => new { x.CommentId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_CommentLikeNotification_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(4883));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(4886));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5916));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5919));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5919));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5920));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5921));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5922));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5923));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5924));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5925));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5926));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5927));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5928));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(5928));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6028));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6031));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6032));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6033));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6034));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6035));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6036));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6037));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6038));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6039));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6077));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6078));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6079));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6079));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6080));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6080));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6081));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6081));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6082));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 37, 8, 808, DateTimeKind.Utc).AddTicks(6082));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CommentLikeNotification");

            migrationBuilder.AddColumn<bool>(
                name: "IsRemoved",
                table: "CommentUserLikes",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "RemovedAt",
                table: "CommentUserLikes",
                type: "datetime2",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(7052));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(7054));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8277));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8280));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8280));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8281));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8281));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8281));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8282));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8282));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8283));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8283));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8284));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8284));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8285));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8285));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8285));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8286));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8286));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8287));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8287));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8288));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8288));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8288));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8289));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8422));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8425));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8425));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8426));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8426));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8426));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8427));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8427));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8428));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8428));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8429));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8429));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8429));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8430));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8430));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8431));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8431));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8431));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8432));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8432));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8433));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8433));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8434));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8434));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8434));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8435));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8435));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8436));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8436));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8437));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8437));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 5, 15, 0, 54, 346, DateTimeKind.Utc).AddTicks(8437));
        }
    }
}
