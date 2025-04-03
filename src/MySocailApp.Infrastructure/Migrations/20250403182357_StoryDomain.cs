using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class StoryDomain : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Stories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    Media_ContainerName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Media_BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Media_BlobNameOfFrame = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Media_Size = table.Column<long>(type: "bigint", nullable: false),
                    Media_Height = table.Column<double>(type: "float", nullable: false),
                    Media_Width = table.Column<double>(type: "float", nullable: false),
                    Media_Duration = table.Column<double>(type: "float", nullable: false),
                    Media_MultimediaType = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Stories", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Stories");
        }
    }
}
