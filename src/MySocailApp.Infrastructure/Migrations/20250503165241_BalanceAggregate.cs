using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class BalanceAggregate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Model_Input_Number",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Model_Input_Price",
                table: "Solutions",
                type: "decimal(18,9)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Model_Output_Number",
                table: "Solutions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Model_Output_Price",
                table: "Solutions",
                type: "decimal(18,9)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Balances",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    Credit_Currency_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Credit_Amount = table.Column<decimal>(type: "decimal(18,9)", nullable: false),
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
                    Model_Input_Price = table.Column<decimal>(type: "decimal(18,9)", nullable: false),
                    Model_Input_Number = table.Column<int>(type: "int", nullable: false),
                    Model_Output_Price = table.Column<decimal>(type: "decimal(18,9)", nullable: false),
                    Model_Output_Number = table.Column<int>(type: "int", nullable: false),
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
                name: "Model_Input_Number",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Input_Price",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Output_Number",
                table: "Solutions");

            migrationBuilder.DropColumn(
                name: "Model_Output_Price",
                table: "Solutions");
        }
    }
}
