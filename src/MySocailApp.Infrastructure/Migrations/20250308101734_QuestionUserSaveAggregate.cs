using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class QuestionUserSaveAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_QuestionUserSaves_Questions_QuestionId",
                table: "QuestionUserSaves");

            migrationBuilder.DropIndex(
                name: "IX_QuestionUserSaves_QuestionId",
                table: "QuestionUserSaves");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserSaves_QuestionId",
                table: "QuestionUserSaves",
                column: "QuestionId");

            migrationBuilder.AddForeignKey(
                name: "FK_QuestionUserSaves_Questions_QuestionId",
                table: "QuestionUserSaves",
                column: "QuestionId",
                principalTable: "Questions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
