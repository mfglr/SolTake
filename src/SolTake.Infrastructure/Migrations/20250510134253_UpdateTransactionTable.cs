using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateTransactionTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Model_Name",
                table: "Transactions");

            migrationBuilder.DropColumn(
                name: "Model_Input_SolPerToken",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Input_TokenNumber",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Name",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Output_SolPerToken",
                table: "Solutions");

            migrationBuilder.RenameColumn(
                name: "Model_Output_TokenNumber",
                table: "Transactions",
                newName: "SolPerOutputToken");

            migrationBuilder.RenameColumn(
                name: "Model_Output_SolPerToken",
                table: "Transactions",
                newName: "SolPerInputToken");

            migrationBuilder.RenameColumn(
                name: "Model_Input_TokenNumber",
                table: "Transactions",
                newName: "NumberOfOutputToken");

            migrationBuilder.RenameColumn(
                name: "Model_Input_SolPerToken",
                table: "Transactions",
                newName: "NumberOfInputToken");

            migrationBuilder.RenameColumn(
                name: "Model_Output_TokenNumber",
                table: "Solutions",
                newName: "AIModelId");

            migrationBuilder.AddColumn<int>(
                name: "AIModelId",
                table: "Transactions",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AIModelId",
                table: "Transactions");

            migrationBuilder.RenameColumn(
                name: "SolPerOutputToken",
                table: "Transactions",
                newName: "Model_Output_TokenNumber");

            migrationBuilder.RenameColumn(
                name: "SolPerInputToken",
                table: "Transactions",
                newName: "Model_Output_SolPerToken");

            migrationBuilder.RenameColumn(
                name: "NumberOfOutputToken",
                table: "Transactions",
                newName: "Model_Input_TokenNumber");

            migrationBuilder.RenameColumn(
                name: "NumberOfInputToken",
                table: "Transactions",
                newName: "Model_Input_SolPerToken");

            migrationBuilder.RenameColumn(
                name: "AIModelId",
                table: "Solutions",
                newName: "Model_Output_TokenNumber");

            migrationBuilder.AddColumn<string>(
                name: "Model_Name",
                table: "Transactions",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "Model_Input_SolPerToken",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Model_Input_TokenNumber",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Model_Name",
                table: "Solutions",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Model_Output_SolPerToken",
                table: "Solutions",
                type: "int",
                nullable: true);
        }
    }
}
