using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateTopicRequestTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RejectionReason_Value",
                table: "TopicRequests");

            migrationBuilder.AddColumn<int>(
                name: "RejectionReason",
                table: "TopicRequests",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RejectionReason",
                table: "TopicRequests");

            migrationBuilder.AddColumn<string>(
                name: "RejectionReason_Value",
                table: "TopicRequests",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
