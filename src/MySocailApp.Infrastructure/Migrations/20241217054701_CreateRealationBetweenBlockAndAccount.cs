using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateRealationBetweenBlockAndAccount : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Block_Accounts_AccountId",
                table: "Block");

            migrationBuilder.DropIndex(
                name: "IX_Block_AccountId",
                table: "Block");

            migrationBuilder.DropColumn(
                name: "AccountId",
                table: "Block");

            migrationBuilder.CreateIndex(
                name: "IX_Block_BlockedId",
                table: "Block",
                column: "BlockedId");

            migrationBuilder.AddForeignKey(
                name: "FK_Block_Accounts_BlockedId",
                table: "Block",
                column: "BlockedId",
                principalTable: "Accounts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Block_Accounts_BlockedId",
                table: "Block");

            migrationBuilder.DropIndex(
                name: "IX_Block_BlockedId",
                table: "Block");

            migrationBuilder.AddColumn<int>(
                name: "AccountId",
                table: "Block",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Block_AccountId",
                table: "Block",
                column: "AccountId");

            migrationBuilder.AddForeignKey(
                name: "FK_Block_Accounts_AccountId",
                table: "Block",
                column: "AccountId",
                principalTable: "Accounts",
                principalColumn: "Id");
        }
    }
}
