using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateQuestionPublishingState : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDraft",
                table: "Questions");

            migrationBuilder.RenameColumn(
                name: "PublishedAt",
                table: "Questions",
                newName: "PublishingStateChagedAt");

            migrationBuilder.AddColumn<int>(
                name: "PublishingState",
                table: "Questions",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PublishingState",
                table: "Questions");

            migrationBuilder.RenameColumn(
                name: "PublishingStateChagedAt",
                table: "Questions",
                newName: "PublishedAt");

            migrationBuilder.AddColumn<bool>(
                name: "IsDraft",
                table: "Questions",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
