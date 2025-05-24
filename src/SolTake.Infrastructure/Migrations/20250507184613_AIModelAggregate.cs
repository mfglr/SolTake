using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AIModelAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AIModels",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SolPerInputToken_Amount = table.Column<int>(type: "int", nullable: false),
                    SolPerOutputToken_Amount = table.Column<int>(type: "int", nullable: false),
                    Image_ContainerName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Image_BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Image_BlobNameOfFrame = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Image_Size = table.Column<long>(type: "bigint", nullable: false),
                    Image_Height = table.Column<double>(type: "float", nullable: false),
                    Image_Width = table.Column<double>(type: "float", nullable: false),
                    Image_Duration = table.Column<double>(type: "float", nullable: false),
                    Image_MultimediaType = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AIModels", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AIModels");
        }
    }
}
