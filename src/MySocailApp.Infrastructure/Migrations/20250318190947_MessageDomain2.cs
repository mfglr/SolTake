using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class MessageDomain2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsConnected",
                table: "MessageConnections");

            migrationBuilder.AlterColumn<string>(
                name: "ConnectionId",
                table: "MessageConnections",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "State",
                table: "MessageConnections",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "TypingId",
                table: "MessageConnections",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "State",
                table: "MessageConnections");

            migrationBuilder.DropColumn(
                name: "TypingId",
                table: "MessageConnections");

            migrationBuilder.AlterColumn<string>(
                name: "ConnectionId",
                table: "MessageConnections",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddColumn<bool>(
                name: "IsConnected",
                table: "MessageConnections",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
