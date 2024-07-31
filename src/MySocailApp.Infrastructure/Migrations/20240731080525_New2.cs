using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class New2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLike_Comments_QuestionCommentId",
                table: "CommentUserLike");

            migrationBuilder.RenameColumn(
                name: "QuestionCommentId",
                table: "CommentUserLike",
                newName: "CommentId");

            migrationBuilder.AddColumn<byte[]>(
                name: "RowVersion",
                table: "Messages",
                type: "rowversion",
                rowVersion: true,
                nullable: false,
                defaultValue: new byte[0]);

            migrationBuilder.CreateTable(
                name: "MessageUserReceipts",
                columns: table => new
                {
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserReceipts", x => new { x.MessageId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_MessageUserReceipts_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MessageUserViews",
                columns: table => new
                {
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserViews", x => new { x.MessageId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_MessageUserViews_Messages_MessageId",
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
                value: new DateTime(2024, 7, 31, 8, 5, 25, 306, DateTimeKind.Utc).AddTicks(9178));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 306, DateTimeKind.Utc).AddTicks(9180));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(91));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(93));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(94));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(94));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(95));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(95));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(96));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(96));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(97));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(97));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(98));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(98));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(98));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(99));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(99));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(100));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(100));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(101));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(101));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(102));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(102));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(102));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(103));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(208));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(209));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(210));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(211));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(212));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(213));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(214));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(215));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(215));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(216));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(216));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(217));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(218));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(218));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(219));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(220));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(220));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(221));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(221));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(222));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(222));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(222));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 31, 8, 5, 25, 307, DateTimeKind.Utc).AddTicks(223));

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLike_Comments_CommentId",
                table: "CommentUserLike",
                column: "CommentId",
                principalTable: "Comments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLike_Comments_CommentId",
                table: "CommentUserLike");

            migrationBuilder.DropTable(
                name: "MessageUserReceipts");

            migrationBuilder.DropTable(
                name: "MessageUserViews");

            migrationBuilder.DropColumn(
                name: "RowVersion",
                table: "Messages");

            migrationBuilder.RenameColumn(
                name: "CommentId",
                table: "CommentUserLike",
                newName: "QuestionCommentId");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(6354));

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(6357));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7674));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7678));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7679));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7679));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7680));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7680));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7681));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7681));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7682));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7682));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7683));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7683));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7684));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7685));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7685));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7686));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7687));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7687));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7688));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7688));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7689));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7689));

            migrationBuilder.UpdateData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7690));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7860));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7867));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7867));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 4,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7868));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 5,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7868));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 6,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7869));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 7,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7869));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 8,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7870));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 9,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7870));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 10,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7871));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 11,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7872));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 12,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7872));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 13,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7873));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 14,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7873));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 15,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7874));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 16,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7874));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 17,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7875));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 18,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7875));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 19,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7876));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 20,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7876));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 21,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7877));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 22,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7877));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 23,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7878));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 24,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7879));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 25,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7879));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 26,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7880));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 27,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7880));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 28,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7881));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 29,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7881));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 30,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7882));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 31,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7882));

            migrationBuilder.UpdateData(
                table: "Topics",
                keyColumn: "Id",
                keyValue: 32,
                column: "CreatedAt",
                value: new DateTime(2024, 7, 30, 17, 5, 56, 80, DateTimeKind.Utc).AddTicks(7883));

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLike_Comments_QuestionCommentId",
                table: "CommentUserLike",
                column: "QuestionCommentId",
                principalTable: "Comments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
