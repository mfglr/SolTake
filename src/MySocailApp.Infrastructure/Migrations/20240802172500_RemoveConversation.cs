using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveConversation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Messages_AppUsers_OwnerId",
                table: "Messages");

            migrationBuilder.DropForeignKey(
                name: "FK_Messages_Conversations_ConversationId",
                table: "Messages");

            migrationBuilder.DropTable(
                name: "ConversationUser");

            migrationBuilder.DropTable(
                name: "Conversations");

            migrationBuilder.RenameColumn(
                name: "OwnerId",
                table: "Messages",
                newName: "SenderId");

            migrationBuilder.RenameColumn(
                name: "ConversationId",
                table: "Messages",
                newName: "ReceiverId");

            migrationBuilder.RenameIndex(
                name: "IX_Messages_OwnerId",
                table: "Messages",
                newName: "IX_Messages_SenderId");

            migrationBuilder.RenameIndex(
                name: "IX_Messages_ConversationId",
                table: "Messages",
                newName: "IX_Messages_ReceiverId");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 572, DateTimeKind.Utc).AddTicks(9929));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 572, DateTimeKind.Utc).AddTicks(9933));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(831));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(834));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(834));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(835));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(835));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(835));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(836));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(836));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(837));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(838));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(838));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(839));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(839));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(840));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(840));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(840));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(841));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(841));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(842));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(842));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(843));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(977));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(980));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(981));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(982));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(982));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(983));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(983));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(984));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(984));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(985));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(985));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(985));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(986));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(986));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(987));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(987));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(988));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(988));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(989));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(989));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(990));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(990));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(991));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(991));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(992));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(992));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(993));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(993));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(994));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 8, 2, 17, 24, 59, 573, DateTimeKind.Utc).AddTicks(994));

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_AppUsers_ReceiverId",
                table: "Messages",
                column: "ReceiverId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_AppUsers_SenderId",
                table: "Messages",
                column: "SenderId",
                principalTable: "AppUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Messages_AppUsers_ReceiverId",
                table: "Messages");

            migrationBuilder.DropForeignKey(
                name: "FK_Messages_AppUsers_SenderId",
                table: "Messages");

            migrationBuilder.RenameColumn(
                name: "SenderId",
                table: "Messages",
                newName: "OwnerId");

            migrationBuilder.RenameColumn(
                name: "ReceiverId",
                table: "Messages",
                newName: "ConversationId");

            migrationBuilder.RenameIndex(
                name: "IX_Messages_SenderId",
                table: "Messages",
                newName: "IX_Messages_OwnerId");

            migrationBuilder.RenameIndex(
                name: "IX_Messages_ReceiverId",
                table: "Messages",
                newName: "IX_Messages_ConversationId");

            migrationBuilder.CreateTable(
                name: "Conversations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    LastMessageCreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Conversations", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ConversationUser",
                columns: table => new
                {
                    ConversationId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ConversationUser", x => new { x.ConversationId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_ConversationUser_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ConversationUser_Conversations_ConversationId",
                        column: x => x.ConversationId,
                        principalTable: "Conversations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(4863));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(4866));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5799));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5802));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5802));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5803));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5803));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5804));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5805));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5806));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5807));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5808));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5809));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5810));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5811));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5811));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5947));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5949));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5950));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5951));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5952));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5953));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5954));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5955));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5956));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5957));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5958));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5959));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5960));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5960));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5961));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5962));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5962));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 22, 24, 48, 257, DateTimeKind.Utc).AddTicks(5963));

            migrationBuilder.CreateIndex(
                name: "IX_ConversationUser_AppUserId",
                table: "ConversationUser",
                column: "AppUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_AppUsers_OwnerId",
                table: "Messages",
                column: "OwnerId",
                principalTable: "AppUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_Conversations_ConversationId",
                table: "Messages",
                column: "ConversationId",
                principalTable: "Conversations",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
