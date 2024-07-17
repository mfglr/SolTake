using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EmailConfirmationToken_Token = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    EmailConfirmationToken_ExpirationAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EmailConfirmationToken_NumberOfFailedAttemps = table.Column<int>(type: "int", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Exams",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ShortName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exams", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AppUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Image_BlobName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Image_CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Gender = table.Column<int>(type: "int", nullable: false),
                    BirthDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ProfileVisibility = table.Column<int>(type: "int", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AppUsers_AspNetUsers_Id",
                        column: x => x.Id,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false),
                    RoleId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Subjects",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ExamId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subjects", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Subjects_Exams_ExamId",
                        column: x => x.ExamId,
                        principalTable: "Exams",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AppUserImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AppUserImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AppUserImage_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Block",
                columns: table => new
                {
                    BlockerId = table.Column<int>(type: "int", nullable: false),
                    BlockedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Block", x => new { x.BlockerId, x.BlockedId });
                    table.ForeignKey(
                        name: "FK_Block_AppUsers_BlockedId",
                        column: x => x.BlockedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Block_AppUsers_BlockerId",
                        column: x => x.BlockerId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Follow",
                columns: table => new
                {
                    FollowerId = table.Column<int>(type: "int", nullable: false),
                    FollowedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Follow", x => new { x.FollowerId, x.FollowedId });
                    table.ForeignKey(
                        name: "FK_Follow_AppUsers_FollowedId",
                        column: x => x.FollowedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Follow_AppUsers_FollowerId",
                        column: x => x.FollowerId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "FollowRequest",
                columns: table => new
                {
                    RequesterId = table.Column<int>(type: "int", nullable: false),
                    RequestedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RemovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FollowRequest", x => new { x.RequesterId, x.RequestedId });
                    table.ForeignKey(
                        name: "FK_FollowRequest_AppUsers_RequestedId",
                        column: x => x.RequestedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_FollowRequest_AppUsers_RequesterId",
                        column: x => x.RequesterId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Questions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updatedat = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ExamId = table.Column<int>(type: "int", nullable: false),
                    SubjectId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Questions_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Questions_Exams_ExamId",
                        column: x => x.ExamId,
                        principalTable: "Exams",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Questions_Subjects_SubjectId",
                        column: x => x.SubjectId,
                        principalTable: "Subjects",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Topics",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SubjectId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Topics", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Topics_Subjects_SubjectId",
                        column: x => x.SubjectId,
                        principalTable: "Subjects",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuestionImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Dimention_Height = table.Column<float>(type: "real", nullable: false),
                    Dimention_Width = table.Column<float>(type: "real", nullable: false),
                    QuestionId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_QuestionImage_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "QuestionUserLike",
                columns: table => new
                {
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatetAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionUserLike", x => new { x.QuestionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_QuestionUserLike_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_QuestionUserLike_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuestionTopic",
                columns: table => new
                {
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    TopicId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionTopic", x => new { x.QuestionId, x.TopicId });
                    table.ForeignKey(
                        name: "FK_QuestionTopic_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_QuestionTopic_Topics_TopicId",
                        column: x => x.TopicId,
                        principalTable: "Topics",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { 1, null, "user", "USER" },
                    { 2, null, "admin", "ADMIN" }
                });

            migrationBuilder.InsertData(
                table: "Exams",
                columns: new[] { "Id", "CreatedAt", "FullName", "ShortName", "UpdatedAt" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 17, 12, 49, 19, 806, DateTimeKind.Utc).AddTicks(9972), "Temel Yeterlilik Testi", "TYT", null },
                    { 2, new DateTime(2024, 7, 17, 12, 49, 19, 806, DateTimeKind.Utc).AddTicks(9975), "Alan Yeterlilik Testi", "AYT", null }
                });

            migrationBuilder.InsertData(
                table: "Subjects",
                columns: new[] { "Id", "CreatedAt", "ExamId", "Name", "UpdatedAt" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1681), 1, "TYT - Türkçe", null },
                    { 2, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1684), 1, "TYT - Tarih", null },
                    { 3, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1684), 1, "TYT - Coğrafya", null },
                    { 4, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1685), 1, "TYT - Felsefe", null },
                    { 5, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1685), 1, "TYT - Din Kültürü ve Ahlâk Bilgisi", null },
                    { 6, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1686), 1, "TYT - Matematik", null },
                    { 7, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1686), 1, "TYT - Geometri", null },
                    { 8, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1687), 1, "TYT - Fizik", null },
                    { 9, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1687), 1, "TYT - Kimya", null },
                    { 10, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1688), 1, "TYT - Biyoloji", null },
                    { 11, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1688), 2, "AYT - Matematik", null },
                    { 12, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1689), 2, "AYT - Geometri", null },
                    { 13, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1689), 2, "AYT - Fizik", null },
                    { 14, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1690), 2, "AYT - Kimya", null },
                    { 15, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1690), 2, "AYT - Biyoloji ", null },
                    { 16, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1691), 2, "AYT - Coğrafya ", null },
                    { 17, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1691), 2, "AYT - Tarih ", null },
                    { 18, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1692), 2, "AYT - Türk Dili ve Edebiyatı", null },
                    { 19, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1692), 2, "AYT - Din Kültürü ve Ahlâk Bilgisi", null },
                    { 20, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1693), 2, "AYT - Felsefe", null },
                    { 21, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1693), 2, "AYT - Psikoloji", null },
                    { 22, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1694), 2, "AYT - Sosyoloji", null },
                    { 23, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1694), 2, "AYT - Mantık", null }
                });

            migrationBuilder.InsertData(
                table: "Topics",
                columns: new[] { "Id", "CreatedAt", "Name", "SubjectId", "UpdatedAt" },
                values: new object[,]
                {
                    { 1, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1813), "Sözcükte Anlam", 1, null },
                    { 2, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1815), "Söz Yorumu", 1, null },
                    { 3, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1816), "Deyim ve Atasözü", 1, null },
                    { 4, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1816), "Cümlede Anlam", 1, null },
                    { 5, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1817), "Paragraf", 1, null },
                    { 6, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1817), "Paragrafta Anlatım Teknikleri", 1, null },
                    { 7, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1818), "Paragrafta Düşünceyi Geliştirme Yolları", 1, null },
                    { 8, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1818), "Paragrafta Yapı", 1, null },
                    { 9, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1819), "Paragrafta Konu-Ana Düşünce", 1, null },
                    { 10, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1819), "Paragrafta Yardımcı Düşünce", 1, null },
                    { 11, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1820), "Ses Bilgisi", 1, null },
                    { 12, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1820), "Yazım Kuralları", 1, null },
                    { 13, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1821), "Noktalama İşaretleri", 1, null },
                    { 14, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1821), "Sözcükte Yapı/Ekler", 1, null },
                    { 15, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1822), "Sözcük Türleri", 1, null },
                    { 16, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1822), "İsimler", 1, null },
                    { 17, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1823), "Zamirler", 1, null },
                    { 18, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1823), "Sıfatlar", 1, null },
                    { 19, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1824), "Zarflar", 1, null },
                    { 20, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1824), "Edat", 1, null },
                    { 21, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1825), "Bağlaç", 1, null },
                    { 22, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1825), "Ünlem", 1, null },
                    { 23, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1826), "Edat - Bağlaç - Ünlem", 1, null },
                    { 24, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1826), "Fiiller", 1, null },
                    { 25, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1827), "Fiilde Anlam (Kip-Kişi-Yapı)", 1, null },
                    { 26, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1827), "Ek Fiil", 1, null },
                    { 27, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1828), "Fiilimsi", 1, null },
                    { 28, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1828), "Fiilde Çatı", 1, null },
                    { 29, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1829), "Sözcük Grupları", 1, null },
                    { 30, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1829), "Cümlenin Ögeleri", 1, null },
                    { 31, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1830), "Cümle Türleri", 1, null },
                    { 32, new DateTime(2024, 7, 17, 12, 49, 19, 807, DateTimeKind.Utc).AddTicks(1830), "Anlatım Bozukluğu", 1, null }
                });

            migrationBuilder.CreateIndex(
                name: "IX_AppUserImage_AppUserId",
                table: "AppUserImage",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Block_BlockedId",
                table: "Block",
                column: "BlockedId");

            migrationBuilder.CreateIndex(
                name: "IX_Follow_FollowedId",
                table: "Follow",
                column: "FollowedId");

            migrationBuilder.CreateIndex(
                name: "IX_FollowRequest_RequestedId",
                table: "FollowRequest",
                column: "RequestedId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionImage_QuestionId",
                table: "QuestionImage",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_Questions_AppUserId",
                table: "Questions",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Questions_ExamId",
                table: "Questions",
                column: "ExamId");

            migrationBuilder.CreateIndex(
                name: "IX_Questions_SubjectId",
                table: "Questions",
                column: "SubjectId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionTopic_TopicId",
                table: "QuestionTopic",
                column: "TopicId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserLike_AppUserId",
                table: "QuestionUserLike",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Subjects_ExamId",
                table: "Subjects",
                column: "ExamId");

            migrationBuilder.CreateIndex(
                name: "IX_Topics_SubjectId",
                table: "Topics",
                column: "SubjectId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AppUserImage");

            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "Block");

            migrationBuilder.DropTable(
                name: "Follow");

            migrationBuilder.DropTable(
                name: "FollowRequest");

            migrationBuilder.DropTable(
                name: "QuestionImage");

            migrationBuilder.DropTable(
                name: "QuestionTopic");

            migrationBuilder.DropTable(
                name: "QuestionUserLike");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Topics");

            migrationBuilder.DropTable(
                name: "Questions");

            migrationBuilder.DropTable(
                name: "AppUsers");

            migrationBuilder.DropTable(
                name: "Subjects");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Exams");
        }
    }
}
