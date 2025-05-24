using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class BalanceAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            migrationBuilder.AddColumn<int>(
                name: "Model_Output_SolPerToken",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Model_Output_TokenNumber",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Balances",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    Credit_Amount = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Balances", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BalanceId = table.Column<int>(type: "int", nullable: false),
                    Model_Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Model_Input_SolPerToken = table.Column<int>(type: "int", nullable: false),
                    Model_Input_TokenNumber = table.Column<int>(type: "int", nullable: false),
                    Model_Output_SolPerToken = table.Column<int>(type: "int", nullable: false),
                    Model_Output_TokenNumber = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Balances");

            migrationBuilder.DropTable(
                name: "Transactions");

            migrationBuilder.DropColumn(
                name: "Model_Input_SolPerToken",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Input_TokenNumber",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Output_SolPerToken",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Output_TokenNumber",
                table: "Solutions");
        }
    }
}
