using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateMessageUserRemoveTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "NumberOfImages",
                table: "MessageResponseDtos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "ReceiverId",
                table: "MessageResponseDtos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "SenderId",
                table: "MessageResponseDtos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "MessageUserRemove",
                columns: table => new
                {
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserRemove", x => new { x.MessageId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_MessageUserRemove_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(6391));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(6393));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7529));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7532));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7532));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7533));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7533));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7534));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7534));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7535));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7535));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7536));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7536));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7536));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7537));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7537));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7538));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7538));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7539));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7539));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7540));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7540));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7540));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7541));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7541));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7648));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7651));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7651));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7652));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7652));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7652));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7653));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7653));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7654));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7654));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7655));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7655));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7656));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7656));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7657));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7657));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7658));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7658));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7658));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7659));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7659));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7660));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7660));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7661));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7661));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7662));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7662));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7663));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7663));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7663));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7664));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 11, 22, 39, 55, 109, DateTimeKind.Utc).AddTicks(7664));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MessageUserRemove");

            migrationBuilder.DropColumn(
                name: "NumberOfImages",
                table: "MessageResponseDtos");

            migrationBuilder.DropColumn(
                name: "ReceiverId",
                table: "MessageResponseDtos");

            migrationBuilder.DropColumn(
                name: "SenderId",
                table: "MessageResponseDtos");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(3538));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(3541));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4552));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4554));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4555));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4555));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4556));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4556));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4557));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4557));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4558));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4558));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4559));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4559));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4560));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4560));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4561));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4561));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4562));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4562));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4563));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4563));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4563));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4564));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4564));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4677));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4680));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4681));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4681));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4682));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4682));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4683));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4683));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4684));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4684));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4685));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4685));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4685));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4686));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4686));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4687));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4687));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4688));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4688));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4689));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4689));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4690));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4690));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4691));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4691));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4692));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4692));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4693));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4693));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4693));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4694));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 9, 7, 22, 30, 14, 378, DateTimeKind.Utc).AddTicks(4694));
        }
    }
}
