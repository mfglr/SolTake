using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SolTake.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class UpdateExamTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ShortName",
                table: "Exams",
                newName: "Name_Value");

            migrationBuilder.RenameColumn(
                name: "FullName",
                table: "Exams",
                newName: "Initialism_Value");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name_Value",
                table: "Exams",
                newName: "ShortName");

            migrationBuilder.RenameColumn(
                name: "Initialism_Value",
                table: "Exams",
                newName: "FullName");

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "FullName", "ShortName" },
                values: new object[] { "Temel Yeterlilik Testi", "TYT" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "FullName", "ShortName" },
                values: new object[] { "Alan Yeterlilik Testi", "AYT" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "FullName", "ShortName" },
                values: new object[] { "Liselere Geçiş Sistemi", "LGS" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 4,
                columns: new[] { "FullName", "ShortName" },
                values: new object[] { "Kamu Personeli Seçme Sınavı", "KPSS" });

            migrationBuilder.UpdateData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 5,
                columns: new[] { "FullName", "ShortName" },
                values: new object[] { "Dikey Geçiş Sınavı", "DGS" });
        }
    }
}
