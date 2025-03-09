using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class SolutionUserVoteAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_SolutionUserVotes_Solutions_SolutionId",
                table: "SolutionUserVotes");

            migrationBuilder.DropTable(
                name: "SolutionUserVoteNotifications");

            migrationBuilder.DropIndex(
                name: "IX_SolutionUserVotes_SolutionId",
                table: "SolutionUserVotes");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SolutionUserVoteNotifications",
                columns: table => new
                {
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionUserVoteNotifications", x => new { x.SolutionId, x.UserId });
                    table.ForeignKey(
                        name: "FK_SolutionUserVoteNotifications_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserVotes_SolutionId",
                table: "SolutionUserVotes",
                column: "SolutionId");

            migrationBuilder.AddForeignKey(
                name: "FK_SolutionUserVotes_Solutions_SolutionId",
                table: "SolutionUserVotes",
                column: "SolutionId",
                principalTable: "Solutions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
