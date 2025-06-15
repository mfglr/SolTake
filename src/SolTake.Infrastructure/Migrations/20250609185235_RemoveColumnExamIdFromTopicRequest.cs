using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class RemoveColumnExamIdFromTopicRequest : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ExamId",
                table: "TopicRequests");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ExamId",
                table: "TopicRequests",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
