using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddTopicsOfDGS : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Exams",
                columns: new[] { "Id", "FullName", "ShortName" },
                values: new object[] { 5, "Dikey Geçiş Sınavı", "DGS" });

            migrationBuilder.InsertData(
                table: "Subjects",
                columns: new[] { "Id", "ExamId", "Name" },
                values: new object[,]
                {
                    { 401, 5, "DGS - Matematik" },
                    { 402, 5, "DGS - Türkçe" },
                    { 403, 5, "DGS - Geometri" }
                });

            migrationBuilder.InsertData(
                table: "SubjectTopics",
                columns: new[] { "SubjectId", "TopicId" },
                values: new object[,]
                {
                    { 401, 1 },
                    { 401, 2 },
                    { 401, 3 },
                    { 401, 4 },
                    { 401, 5 },
                    { 401, 6 },
                    { 401, 7 },
                    { 401, 8 },
                    { 401, 9 },
                    { 401, 10 },
                    { 401, 11 },
                    { 401, 12 },
                    { 401, 13 },
                    { 401, 14 },
                    { 401, 15 },
                    { 401, 16 },
                    { 401, 17 },
                    { 401, 18 },
                    { 401, 19 },
                    { 401, 20 },
                    { 401, 21 },
                    { 401, 22 },
                    { 401, 23 },
                    { 401, 24 },
                    { 401, 25 },
                    { 401, 26 },
                    { 401, 27 },
                    { 401, 28 },
                    { 401, 29 },
                    { 401, 30 },
                    { 401, 31 },
                    { 401, 32 },
                    { 401, 33 },
                    { 401, 34 },
                    { 401, 35 },
                    { 401, 36 },
                    { 401, 37 },
                    { 401, 38 },
                    { 401, 39 },
                    { 401, 40 },
                    { 401, 41 },
                    { 401, 42 },
                    { 401, 43 },
                    { 401, 44 },
                    { 401, 45 },
                    { 401, 46 },
                    { 401, 47 },
                    { 401, 48 },
                    { 401, 49 },
                    { 401, 50 },
                    { 402, 9001 },
                    { 402, 9002 },
                    { 402, 9003 },
                    { 402, 9004 },
                    { 402, 9005 },
                    { 402, 9006 },
                    { 402, 9007 },
                    { 402, 9008 },
                    { 402, 9009 },
                    { 402, 9010 },
                    { 402, 9011 },
                    { 402, 9012 },
                    { 402, 9013 },
                    { 402, 9014 },
                    { 402, 9015 },
                    { 402, 9016 },
                    { 402, 9017 },
                    { 402, 9018 },
                    { 402, 9019 },
                    { 402, 9020 },
                    { 402, 9021 },
                    { 402, 9022 },
                    { 402, 9023 },
                    { 402, 9024 },
                    { 402, 9025 },
                    { 402, 9026 },
                    { 402, 9027 },
                    { 402, 9028 },
                    { 402, 9029 },
                    { 402, 9030 },
                    { 402, 9031 },
                    { 402, 9032 },
                    { 402, 9033 },
                    { 402, 9034 },
                    { 402, 9035 },
                    { 402, 9036 },
                    { 402, 9037 },
                    { 402, 9038 },
                    { 402, 9039 },
                    { 402, 9040 },
                    { 402, 9041 },
                    { 402, 9042 },
                    { 402, 9043 },
                    { 402, 9044 },
                    { 402, 9045 },
                    { 402, 9046 },
                    { 402, 9047 },
                    { 402, 9048 },
                    { 402, 9049 },
                    { 402, 9050 },
                    { 402, 9051 },
                    { 402, 9052 },
                    { 402, 9053 },
                    { 402, 9054 },
                    { 402, 9055 },
                    { 402, 9056 },
                    { 402, 9057 },
                    { 402, 9058 },
                    { 402, 9059 },
                    { 402, 9060 },
                    { 402, 9061 },
                    { 402, 9062 },
                    { 402, 9063 },
                    { 402, 9064 },
                    { 402, 9065 },
                    { 402, 9066 },
                    { 402, 9067 },
                    { 402, 9068 },
                    { 402, 9069 },
                    { 402, 9070 },
                    { 402, 9071 },
                    { 402, 9072 },
                    { 402, 9073 },
                    { 402, 9074 },
                    { 402, 9075 },
                    { 402, 9076 },
                    { 402, 9077 },
                    { 402, 9078 },
                    { 402, 9079 },
                    { 402, 9080 },
                    { 402, 9081 },
                    { 402, 9082 },
                    { 402, 9083 },
                    { 402, 9084 },
                    { 402, 9085 },
                    { 402, 9086 },
                    { 402, 9087 },
                    { 402, 9088 },
                    { 402, 9089 },
                    { 402, 9090 },
                    { 402, 9091 },
                    { 402, 9092 },
                    { 402, 9093 },
                    { 402, 9094 },
                    { 402, 9095 },
                    { 402, 9096 },
                    { 402, 9097 },
                    { 402, 9098 },
                    { 403, 6001 },
                    { 403, 6002 },
                    { 403, 6003 },
                    { 403, 6004 },
                    { 403, 6005 },
                    { 403, 6006 },
                    { 403, 6007 },
                    { 403, 6008 },
                    { 403, 6009 },
                    { 403, 6010 },
                    { 403, 6011 },
                    { 403, 6012 },
                    { 403, 6013 },
                    { 403, 6014 },
                    { 403, 6015 },
                    { 403, 6016 },
                    { 403, 6017 },
                    { 403, 6018 },
                    { 403, 6019 },
                    { 403, 6020 },
                    { 403, 6021 },
                    { 403, 6022 },
                    { 403, 6023 },
                    { 403, 6024 },
                    { 403, 6025 },
                    { 403, 6026 },
                    { 403, 6027 },
                    { 403, 6028 },
                    { 403, 6029 },
                    { 403, 6030 },
                    { 403, 6031 },
                    { 403, 6032 },
                    { 403, 6033 },
                    { 403, 6034 },
                    { 403, 6035 },
                    { 403, 6036 },
                    { 403, 6037 },
                    { 403, 6038 },
                    { 403, 6039 },
                    { 403, 6040 },
                    { 403, 6041 },
                    { 403, 6042 },
                    { 403, 6043 },
                    { 403, 6044 },
                    { 403, 6045 },
                    { 403, 6046 },
                    { 403, 6047 }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Exams",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 1 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 2 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 3 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 4 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 5 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 6 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 7 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 8 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 9 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 10 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 11 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 12 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 13 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 14 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 15 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 16 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 17 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 18 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 19 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 20 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 21 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 22 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 23 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 24 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 25 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 26 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 27 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 28 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 29 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 30 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 31 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 32 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 33 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 34 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 35 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 36 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 37 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 38 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 39 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 40 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 41 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 42 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 43 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 44 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 45 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 46 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 47 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 48 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 49 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 401, 50 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9001 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9002 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9003 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9004 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9005 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9006 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9007 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9008 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9009 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9010 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9011 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9012 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9013 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9014 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9015 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9016 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9017 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9018 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9019 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9020 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9021 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9022 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9023 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9024 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9025 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9026 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9027 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9028 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9029 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9030 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9031 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9032 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9033 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9034 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9035 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9036 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9037 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9038 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9039 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9040 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9041 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9042 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9043 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9044 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9045 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9046 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9047 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9048 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9049 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9050 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9051 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9052 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9053 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9054 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9055 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9056 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9057 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9058 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9059 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9060 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9061 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9062 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9063 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9064 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9065 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9066 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9067 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9068 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9069 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9070 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9071 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9072 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9073 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9074 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9075 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9076 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9077 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9078 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9079 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9080 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9081 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9082 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9083 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9084 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9085 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9086 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9087 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9088 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9089 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9090 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9091 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9092 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9093 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9094 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9095 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9096 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9097 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 402, 9098 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6001 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6002 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6003 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6004 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6005 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6006 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6007 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6008 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6009 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6010 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6011 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6012 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6013 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6014 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6015 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6016 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6017 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6018 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6019 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6020 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6021 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6022 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6023 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6024 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6025 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6026 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6027 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6028 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6029 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6030 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6031 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6032 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6033 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6034 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6035 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6036 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6037 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6038 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6039 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6040 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6041 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6042 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6043 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6044 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6045 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6046 });

            migrationBuilder.DeleteData(
                table: "SubjectTopics",
                keyColumns: new[] { "SubjectId", "TopicId" },
                keyValues: new object[] { 403, 6047 });

            migrationBuilder.DeleteData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 401);

            migrationBuilder.DeleteData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 402);

            migrationBuilder.DeleteData(
                table: "Subjects",
                keyColumn: "Id",
                keyValue: 403);
        }
    }
}
