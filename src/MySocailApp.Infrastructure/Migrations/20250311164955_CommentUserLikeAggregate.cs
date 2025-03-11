using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CommentUserLikeAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentUserLikes_Comments_CommentId",
                table: "CommentUserLikes");

            migrationBuilder.DropTable(
                name: "CommentUserLikeNotifications");

            migrationBuilder.DropTable(
                name: "CommentUserTags");

            migrationBuilder.DropIndex(
                name: "IX_CommentUserLikes_CommentId",
                table: "CommentUserLikes");

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedAt",
                table: "CommentUserLikes",
                type: "datetime2",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "CommentUserTag",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    CommentId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentUserTag", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CommentUserTag_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserTag_CommentId",
                table: "CommentUserTag",
                column: "CommentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CommentUserTag");

            migrationBuilder.DropColumn(
                name: "UpdatedAt",
                table: "CommentUserLikes");

            migrationBuilder.CreateTable(
                name: "CommentUserLikeNotifications",
                columns: table => new
                {
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentUserLikeNotifications", x => new { x.CommentId, x.UserId });
                    table.ForeignKey(
                        name: "FK_CommentUserLikeNotifications_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CommentUserTags",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentUserTags", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CommentUserTags_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserLikes_CommentId",
                table: "CommentUserLikes",
                column: "CommentId");

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserTags_CommentId",
                table: "CommentUserTags",
                column: "CommentId");

            migrationBuilder.AddForeignKey(
                name: "FK_CommentUserLikes_Comments_CommentId",
                table: "CommentUserLikes",
                column: "CommentId",
                principalTable: "Comments",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
