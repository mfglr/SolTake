using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class QuestionStatus : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsDraft",
                table: "Questions",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "PublishedAt",
                table: "Questions",
                type: "datetime2",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDraft",
                table: "Questions");

            migrationBuilder.DropColumn(
                name: "PublishedAt",
                table: "Questions");
        }
    }
}
