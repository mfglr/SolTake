using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Multimedia : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MessageImage");

            migrationBuilder.DropColumn(
                name: "Image_CreatedAt",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "HasVideo",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_BlobName",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_Duration",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Video_Length",
                table: "Solutions");

            migrationBuilder.RenameColumn(
                name: "AppUserId",
                table: "Solutions",
                newName: "UserId");

            migrationBuilder.AddColumn<string>(
                name: "Image_BlobNameOfFrame",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Image_ContainerName",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Image_Duration",
                table: "Users",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Image_Height",
                table: "Users",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Image_MultimediaType",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "Image_Size",
                table: "Users",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Image_Width",
                table: "Users",
                type: "float",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Content_Value",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.CreateTable(
                name: "MessageMultimedia",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    ContainerName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Size = table.Column<long>(type: "bigint", nullable: false),
                    Height = table.Column<double>(type: "float", nullable: false),
                    Width = table.Column<double>(type: "float", nullable: false),
                    Duration = table.Column<double>(type: "float", nullable: false),
                    MultimediaType = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageMultimedia", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageMultimedia_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MessageMultimedia_MessageId",
                table: "MessageMultimedia",
                column: "MessageId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MessageMultimedia");

            migrationBuilder.DropColumn(
                name: "Image_BlobNameOfFrame",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_ContainerName",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_Duration",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_Height",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_MultimediaType",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_Size",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Image_Width",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "Solutions",
                newName: "AppUserId");

            migrationBuilder.AddColumn<DateTime>(
                name: "Image_CreatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Content_Value",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "HasVideo",
                table: "Solutions",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "Video_BlobName",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Video_Duration",
                table: "Solutions",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "Video_Length",
                table: "Solutions",
                type: "bigint",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "MessageImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Height = table.Column<double>(type: "float", nullable: false),
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Width = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageImage_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MessageImage_MessageId",
                table: "MessageImage",
                column: "MessageId");
        }
    }
}
