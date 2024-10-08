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
                    IsThirdPartyAuthenticated = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    Language = table.Column<string>(type: "nvarchar(max)", nullable: true),
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
                    ShortName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exams", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "MessageResponseDtos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsOwner = table.Column<bool>(type: "bit", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ConversationId = table.Column<int>(type: "int", nullable: false),
                    SenderId = table.Column<int>(type: "int", nullable: false),
                    ReceiverId = table.Column<int>(type: "int", nullable: false),
                    IsEdited = table.Column<bool>(type: "bit", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    State = table.Column<int>(type: "int", nullable: false),
                    NumberOfImages = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "PrivacyPolicies",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AdminId = table.Column<int>(type: "int", nullable: false),
                    BlobNameTr = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BlobNameEn = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PrivacyPolicies", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TermsOfUses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AdminId = table.Column<int>(type: "int", nullable: false),
                    BlobNameTr = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BlobNameEn = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TermsOfUses", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Topics",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Topics", x => x.Id);
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
                name: "AccountPrivacyPolicy",
                columns: table => new
                {
                    PolicyId = table.Column<int>(type: "int", nullable: false),
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false),
                    ApprovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccountPrivacyPolicy", x => new { x.AccountId, x.PolicyId });
                    table.ForeignKey(
                        name: "FK_AccountPrivacyPolicy_AspNetUsers_AccountId",
                        column: x => x.AccountId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AccountTermsOfUse",
                columns: table => new
                {
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    TermsOfUseId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false),
                    ApprovedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccountTermsOfUse", x => new { x.AccountId, x.TermsOfUseId });
                    table.ForeignKey(
                        name: "FK_AccountTermsOfUse_AspNetUsers_AccountId",
                        column: x => x.AccountId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AppUsers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    HasImage = table.Column<bool>(type: "bit", nullable: false),
                    Image_BlobName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Image_CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Biography_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
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
                name: "VerificationToken",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    VerifiedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsVerified = table.Column<bool>(type: "bit", nullable: false),
                    TokenHash = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpirationAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NumberOfFailedAttemps = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationToken", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationToken_AspNetUsers_AccountId",
                        column: x => x.AccountId,
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
                name: "Follows",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FollowerId = table.Column<int>(type: "int", nullable: false),
                    FollowedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Follows", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Follows_AppUsers_FollowedId",
                        column: x => x.FollowedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Follows_AppUsers_FollowerId",
                        column: x => x.FollowerId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Messages",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IsEdited = table.Column<bool>(type: "bit", nullable: false),
                    SenderId = table.Column<int>(type: "int", nullable: false),
                    ReceiverId = table.Column<int>(type: "int", nullable: false),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Messages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Messages_AppUsers_ReceiverId",
                        column: x => x.ReceiverId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Messages_AppUsers_SenderId",
                        column: x => x.SenderId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "NotificationConnections",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    IsConnected = table.Column<bool>(type: "bit", nullable: false),
                    ConnectionId = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NotificationConnections", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NotificationConnections_AppUsers_Id",
                        column: x => x.Id,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserConnections",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false),
                    ConnectionId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsConnected = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserConnections", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserConnections_AppUsers_Id",
                        column: x => x.Id,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserFollowNotification",
                columns: table => new
                {
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    FollowerId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserFollowNotification", x => new { x.AppUserId, x.FollowerId });
                    table.ForeignKey(
                        name: "FK_UserFollowNotification_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserSearchs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SearcherId = table.Column<int>(type: "int", nullable: false),
                    SearchedId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserSearchs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserSearchs_AppUsers_SearchedId",
                        column: x => x.SearchedId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_UserSearchs_AppUsers_SearcherId",
                        column: x => x.SearcherId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Questions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ExamId = table.Column<int>(type: "int", nullable: false),
                    SubjectId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    Content_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Questions_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
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
                name: "SubjectTopic",
                columns: table => new
                {
                    SubjectId = table.Column<int>(type: "int", nullable: false),
                    TopicId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubjectTopic", x => new { x.SubjectId, x.TopicId });
                    table.ForeignKey(
                        name: "FK_SubjectTopic_Subjects_SubjectId",
                        column: x => x.SubjectId,
                        principalTable: "Subjects",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SubjectTopic_Topics_TopicId",
                        column: x => x.TopicId,
                        principalTable: "Topics",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MessageImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Height = table.Column<float>(type: "real", nullable: false),
                    Width = table.Column<float>(type: "real", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageImage_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MessageUserReceive",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserReceive", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageUserReceive_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MessageUserRemove",
                columns: table => new
                {
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserRemove", x => new { x.MessageId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_MessageUserRemove_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MessageUserView",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MessageId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MessageUserView", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageUserView_Messages_MessageId",
                        column: x => x.MessageId,
                        principalTable: "Messages",
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
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Height = table.Column<float>(type: "real", nullable: false),
                    Width = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_QuestionImage_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuestionLikeNotification",
                columns: table => new
                {
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionLikeNotification", x => new { x.QuestionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_QuestionLikeNotification_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuestionTopic",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    TopicId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionTopic", x => x.Id);
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

            migrationBuilder.CreateTable(
                name: "QuestionUserLikes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionUserLikes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_QuestionUserLikes_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_QuestionUserLikes_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "QuestionUserSaves",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_QuestionUserSaves", x => x.Id);
                    table.ForeignKey(
                        name: "FK_QuestionUserSaves_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_QuestionUserSaves_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Solutions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    Content_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Video_BlobName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Video_Duration = table.Column<double>(type: "float", nullable: true),
                    Video_Length = table.Column<long>(type: "bigint", nullable: true),
                    Video_FrameBlobName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Video_FrameHeight = table.Column<float>(type: "real", nullable: true),
                    Video_FrameWidth = table.Column<float>(type: "real", nullable: true),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    State = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Solutions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Solutions_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Solutions_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Comments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    QuestionId = table.Column<int>(type: "int", nullable: true),
                    SolutionId = table.Column<int>(type: "int", nullable: true),
                    IsEdited = table.Column<bool>(type: "bit", nullable: false),
                    Content_Value = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsRemoved = table.Column<bool>(type: "bit", nullable: false),
                    RepliedId = table.Column<int>(type: "int", nullable: true),
                    ParentId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Comments_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Comments_Comments_ParentId",
                        column: x => x.ParentId,
                        principalTable: "Comments",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Comments_Comments_RepliedId",
                        column: x => x.RepliedId,
                        principalTable: "Comments",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Comments_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Comments_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "SolutionImage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    BlobName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Height = table.Column<float>(type: "real", nullable: false),
                    Width = table.Column<float>(type: "real", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionImage", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SolutionImage_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SolutionUserSaves",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionUserSaves", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SolutionUserSaves_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SolutionUserSaves_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SolutionUserVotes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionUserVotes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SolutionUserVotes_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SolutionUserVotes_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SolutionVoteNotification",
                columns: table => new
                {
                    SolutionId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SolutionVoteNotification", x => new { x.SolutionId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_SolutionVoteNotification_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CommentLikeNotification",
                columns: table => new
                {
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentLikeNotification", x => new { x.CommentId, x.AppUserId });
                    table.ForeignKey(
                        name: "FK_CommentLikeNotification_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CommentUserLikes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentUserLikes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CommentUserLikes_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CommentUserLikes_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CommentUserTag",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CommentId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CommentUserTag", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CommentUserTag_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CommentUserTag_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Notifications",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    OwnerId = table.Column<int>(type: "int", nullable: false),
                    AppUserId = table.Column<int>(type: "int", nullable: false),
                    IsViewed = table.Column<bool>(type: "bit", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: false),
                    ParentId = table.Column<int>(type: "int", nullable: true),
                    RepliedId = table.Column<int>(type: "int", nullable: true),
                    CommentId = table.Column<int>(type: "int", nullable: true),
                    QuestionId = table.Column<int>(type: "int", nullable: true),
                    SolutionId = table.Column<int>(type: "int", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Notifications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Notifications_AppUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Notifications_AppUsers_OwnerId",
                        column: x => x.OwnerId,
                        principalTable: "AppUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Notifications_Comments_CommentId",
                        column: x => x.CommentId,
                        principalTable: "Comments",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Notifications_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Notifications_Solutions_SolutionId",
                        column: x => x.SolutionId,
                        principalTable: "Solutions",
                        principalColumn: "Id");
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
                columns: new[] { "Id", "FullName", "ShortName" },
                values: new object[,]
                {
                    { 1, "Temel Yeterlilik Testi", "TYT" },
                    { 2, "Alan Yeterlilik Testi", "AYT" },
                    { 3, "Liselere Geçiş Sistemi", "LGS" },
                    { 4, "Kamu Personeli Seçme Sınavı", "KPSS" }
                });

            migrationBuilder.InsertData(
                table: "PrivacyPolicies",
                columns: new[] { "Id", "AdminId", "BlobNameEn", "BlobNameTr", "CreatedAt" },
                values: new object[] { 1, 1, "privacy_policy_version1_en.html", "privacy_policy_version1_tr.html", new DateTime(2024, 10, 7, 18, 59, 45, 0, DateTimeKind.Unspecified) });

            migrationBuilder.InsertData(
                table: "TermsOfUses",
                columns: new[] { "Id", "AdminId", "BlobNameEn", "BlobNameTr", "CreatedAt" },
                values: new object[] { 1, 1, "terms_of_use_version1_en.html", "terms_of_use_version1_tr.html", new DateTime(2024, 10, 7, 18, 59, 45, 0, DateTimeKind.Unspecified) });

            migrationBuilder.InsertData(
                table: "Topics",
                columns: new[] { "Id", "Name" },
                values: new object[,]
                {
                    { 1, "Matematik Temel Kavramlar" },
                    { 2, "Sayılar" },
                    { 3, "Sayı Basamakları" },
                    { 4, "Sayı Kümeleri" },
                    { 5, "Doğal Sayılar" },
                    { 6, "Tam Sayılar" },
                    { 7, "Ondalık Sayılar" },
                    { 8, "Sayma Sistemleri" },
                    { 9, "Bölme" },
                    { 10, "Bölünebilme Kuralları" },
                    { 11, "EBOB – EKOK" },
                    { 12, "Asal Çarpanlara Ayırma" },
                    { 13, "Denklemler" },
                    { 14, "Rasyonel Sayılar" },
                    { 15, "Kesir ve Kesir Türleri" },
                    { 16, "Rasyonel Sayılarda Dört İşlem" },
                    { 17, "Basit Eşitsizlikler" },
                    { 18, "Mutlak Değer" },
                    { 19, "Üslü Sayılar" },
                    { 20, "Köklü Sayılar" },
                    { 21, "Çarpanlara Ayırma" },
                    { 22, "Oran Orantı" },
                    { 23, "Denklem Çözme" },
                    { 24, "Problemler" },
                    { 25, "Sayı Problemleri" },
                    { 26, "Denklem Kurma Problemleri" },
                    { 27, "Kesir Problemleri" },
                    { 28, "Yaş Problemleri" },
                    { 29, "Havuz Problemleri" },
                    { 30, "Hareket Hız Problemleri" },
                    { 31, "İşçi Emek Problemleri" },
                    { 32, "Yüzde Problemleri" },
                    { 33, "Kar Zarar Problemleri" },
                    { 34, "Karışım Problemleri" },
                    { 35, "Grafik Problemleri" },
                    { 36, "Rutin Olmayan Problemler" },
                    { 37, "Kümeler" },
                    { 38, "Kartezyen Çarpım" },
                    { 39, "İşlem - Modüler Aritmetik" },
                    { 40, "Bağıntı ve Fonksiyon" },
                    { 41, "Faktöriyel" },
                    { 42, "Permütasyon" },
                    { 43, "Kombinasyon" },
                    { 44, "Olasılık" },
                    { 45, "Tablo ve Grafikler" },
                    { 46, "Tablo ve Yorumlama" },
                    { 47, "Grafik ve Yorumlama" },
                    { 48, "Sayısal Mantık" },
                    { 49, "Mantık" },
                    { 50, "Fonskiyonlar" },
                    { 51, "Polinomlar" },
                    { 52, "2.Dereceden Denklemler" },
                    { 53, "Veri – İstatistik" },
                    { 54, "Karmaşık Sayılar" },
                    { 55, "2.Dereceden Eşitsizlikler" },
                    { 56, "Parabol" },
                    { 57, "Trigonometri" },
                    { 58, "Logaritma" },
                    { 59, "Diziler" },
                    { 60, "Limit" },
                    { 61, "Türev" },
                    { 62, "İntegral" },
                    { 63, "Çarpanlar ve Katlar" },
                    { 64, "Üslü İfadeler" },
                    { 65, "Kareköklü İfadeler" },
                    { 66, "Veri Analizi" },
                    { 67, "Basit Olayların Olma Olasılığı" },
                    { 68, "Cebirsel İfadeler ve Özdeşlikler" },
                    { 69, "Doğrusal Denklemler" },
                    { 70, "Eşitsizlikler" },
                    { 71, "Üçgenler" },
                    { 72, "Eşlik ve Benzerlik" },
                    { 73, "Geometrik Cisimler" },
                    { 74, "Dönüşüm Geometrisi" },
                    { 1001, "Canlıların Ortak Özellikleri" },
                    { 1002, "Canlıların Temel Bileşenleri" },
                    { 1003, "Hücre ve Organeller – Madde Geçişleri" },
                    { 1004, "Canlıların Sınıflandırılması" },
                    { 1005, "Hücrede Bölünme – Üreme" },
                    { 1006, "Kalıtım" },
                    { 1007, "Bitki Biyolojisi" },
                    { 1008, "Ekosistem" },
                    { 1009, "Sinir Sistemi" },
                    { 1010, "Endokrin Sistem ve Hormonlar" },
                    { 1011, "Duyu Organları" },
                    { 1012, "Destek ve Hareket Sistemi" },
                    { 1013, "Sindirim Sistemi" },
                    { 1014, "Dolaşım ve Bağışıklık Sistemi" },
                    { 1015, "Solunum Sistemi" },
                    { 1016, "Boşaltım Sistemi" },
                    { 1017, "Üreme Sistemi ve Embriyonik Gelişim" },
                    { 1018, "Komünite Ekolojisi" },
                    { 1019, "Popülasyon Ekolojisi" },
                    { 1020, "Genden Proteine" },
                    { 1021, "Nükleik Asitler" },
                    { 1022, "Genetik Şifre ve Protein Sentezi" },
                    { 1023, "Canlılarda Enerji Dönüşümleri" },
                    { 1024, "Canlılık ve Enerji" },
                    { 1025, "Fotosentez" },
                    { 1026, "Kemosentez" },
                    { 1027, "Hücresel Solunum" },
                    { 1028, "Bitki Biyolojisi" },
                    { 1029, "Canlılar ve Çevre" },
                    { 2001, "Türkiye'nin Coğrafi Konumu" },
                    { 2002, "Türkiye'nin Coğrafi Konumu - Matematik (Mutlak) Konum" },
                    { 2003, "Türkiye'nin Coğrafi Konumu - Türkiye'nin Matematik (Mutlak) Konumu ve Sonuçları" },
                    { 2004, "Türkiye'nin Coğrafi Konumu - Türkiye'nin Özel (Göreceli) Konumu ve Sonuçları" },
                    { 2005, "Türkiye'nin Coğrafi Konumu - Türkiye'nin Jeopolitiği" },
                    { 2006, "Türkiye'nin Yerşekilleri ve Özellikleri" },
                    { 2007, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Yerşekillerinin Genel Özellikleri" },
                    { 2008, "Türkiye'nin Yerşekilleri ve Özellikleri - Fiziki Haritalar" },
                    { 2009, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Jeolojik Geçmişi" },
                    { 2010, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Platoları ve Ovaları" },
                    { 2011, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Dış Güçlerin Oluşturduğu Yer Şekilleri" },
                    { 2012, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Kıyı Tipleri" },
                    { 2013, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Toprak Oluşumu ve Tipleri" },
                    { 2014, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'nin Su Varlığı" },
                    { 2015, "Türkiye'nin Yerşekilleri ve Özellikleri - Türkiye'de Doğal Afetler" },
                    { 2016, "Türkiye'nin İklimi ve Bitki Örtüsü" },
                    { 2017, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin İklimi" },
                    { 2018, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de Sıcaklık" },
                    { 2019, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de Nemlilik ve Yağış" },
                    { 2020, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'de İklim Tipleri" },
                    { 2021, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin Bitki Örtüsü" },
                    { 2022, "Türkiye'nin İklimi ve Bitki Örtüsü - Türkiye'nin İklim Tipleri ve Bitki Örtüsü" },
                    { 2023, "Türkiye'de Nüfus ve Yerleşme" },
                    { 2024, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfus Özellikleri" },
                    { 2025, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfusun Dağılışı ve Nüfus Yoğunluğu" },
                    { 2026, "Türkiye'de Nüfus ve Yerleşme - Türkiye'nin Nüfusu ve Nüfus Sayımları" },
                    { 2027, "Türkiye'de Nüfus ve Yerleşme - Türkiye'nin Nüfus Politikaları" },
                    { 2028, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Nüfus Projeksiyonları: Türkiye Nüfusunun Geleceği" },
                    { 2029, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Göçler" },
                    { 2030, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Yerleşme" },
                    { 2031, "Türkiye'de Nüfus ve Yerleşme - Türkiye'de Mesken Tipleri" },
                    { 2032, "Türkiye'de Tarım, Hayvancılık ve Ormancılık" },
                    { 2033, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Anadolu Uygarlıkları" },
                    { 2034, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Arazi Kullanımı" },
                    { 2035, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye Ekonomisinin Sektörel Dağılımı" },
                    { 2036, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye Ekonomisini Etkileyen Faktörler" },
                    { 2037, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Tarım" },
                    { 2038, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Hayvancılık" },
                    { 2039, "Türkiye'de Tarım, Hayvancılık ve Ormancılık - Türkiye'de Ormancılık" },
                    { 2040, "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi" },
                    { 2041, "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Madenler" },
                    { 2042, "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Enerji Kaynakları" },
                    { 2043, "Türkiye'de Madenler, Enerji Kaynakları ve Sanayi - Türkiye'de Sanayi" },
                    { 2044, "Türkiye'de Ulaşım, Ticaret ve Turizm" },
                    { 2045, "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Ulaşım" },
                    { 2046, "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Ticaret" },
                    { 2047, "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'de Turizm" },
                    { 2048, "Türkiye'de Ulaşım, Ticaret ve Turizm - Türkiye'nin Millî Parkları Türkiye’de Şehirler ve Özellikleri" },
                    { 2049, "Türkiye'nin Coğrafi Bölgeleri" },
                    { 2050, "Türkiye'nin Coğrafi Bölgeleri - Türkiye'de Bölge Sınıflandırması" },
                    { 2051, "Türkiye'nin Coğrafi Bölgeleri - Türkiye'nin Bölgesel Kalkınma Projeleri" },
                    { 2052, "Türkiye'nin Coğrafi Bölgeleri - Türkiye'nin Coğrafi Bölgeleri" },
                    { 2053, "Türkiye'nin Coğrafi Bölgeleri - Karadeniz Bölgesi" },
                    { 2054, "Türkiye'nin Coğrafi Bölgeleri - Marmara Bölgesi" },
                    { 2055, "Türkiye'nin Coğrafi Bölgeleri - Ege Bölgesi" },
                    { 2056, "Türkiye'nin Coğrafi Bölgeleri - Akdeniz Bölgesi" },
                    { 2057, "Türkiye'nin Coğrafi Bölgeleri - İç Anadolu Bölgesi" },
                    { 2058, "Türkiye'nin Coğrafi Bölgeleri - Doğu Anadolu Bölgesi" },
                    { 2059, "Türkiye'nin Coğrafi Bölgeleri - Güneydoğu Anadolu Bölgesi" },
                    { 2060, "Türkiye'nin Coğrafi Bölgeleri - Bölgelerin Özelliklerinin Karşılaştırılması" },
                    { 2061, "Doğa ve İnsan" },
                    { 2062, "Dünya’nın Şekli ve Hareketleri" },
                    { 2063, "Coğrafi Konum" },
                    { 2064, "Harita Bilgisi" },
                    { 2065, "Atmosfer ve Sıcaklık" },
                    { 2066, "İklimler" },
                    { 2067, "Basınç ve Rüzgarlar" },
                    { 2068, "Nem, Yağış ve Buharlaşma" },
                    { 2069, "İç Kuvvetler / Dış Kuvvetler" },
                    { 2070, "Su – Toprak ve Bitkiler" },
                    { 2071, "Nüfus" },
                    { 2072, "Göç" },
                    { 2073, "Yerleşme" },
                    { 2074, "Türkiye’nin Yer Şekilleri" },
                    { 2075, "Ekonomik Faaliyetler" },
                    { 2076, "Bölgeler" },
                    { 2077, "Uluslararası Ulaşım Hatları" },
                    { 2078, "Çevre ve Toplum" },
                    { 2079, "Doğal Afetler" },
                    { 2080, "Ekosistem" },
                    { 2081, "Biyoçeşitlilik" },
                    { 2082, "Biyomlar" },
                    { 2083, "Ekosistemin Unsurları" },
                    { 2084, "Enerji Akışı ve Madde Döngüsü" },
                    { 2085, "Ekstrem Doğa Olayları" },
                    { 2086, "Küresel İklim Değişimi" },
                    { 2087, "Nüfus Politikaları" },
                    { 2088, "Türkiye'de Nüfus ve Yerleşme" },
                    { 2089, "Ekonomik Faaliyetler ve Doğal Kaynaklar" },
                    { 2090, "Göç ve Şehirleşme" },
                    { 2091, "Türkiye Ekonomisi" },
                    { 2092, "Türkiye'nin Ekonomi Politikaları" },
                    { 2093, "Türkiye Ekonomisinin Sektörel Dağılımı" },
                    { 2094, "Türkiye'de Tarım" },
                    { 2095, "Türkiye'de Hayvancılık" },
                    { 2096, "Türkiye'de Madenler ve Enerji Kaynakları" },
                    { 2097, "Türkiye'de Sanayi" },
                    { 2098, "Türkiye'de Ulaşım" },
                    { 2099, "Türkiye'de Ticaret ve Turizm" },
                    { 2100, "Geçmişten Geleceğe Şehir ve Ekonomi" },
                    { 2101, "Türkiye'nin İşlevsel Bölgeleri ve Kalkınma Projeleri" },
                    { 2102, "Hizmet Sektörünün Ekonomideki Yeri" },
                    { 2103, "Küresel Ticaret" },
                    { 2104, "Bölgeler ve Ülkeler" },
                    { 2105, "İlk Uygarlıklar" },
                    { 2106, "Kültür Bölgeleri ve Türk Kültürü" },
                    { 2107, "Sanayileşme Süreci: Almanya" },
                    { 2108, "Tarım ve Ekonomi İlişkisi Fransa – Somali" },
                    { 2109, "Ülkeler Arası Etkileşim" },
                    { 2110, "Jeopolitik Konum" },
                    { 2111, "Çatışma Bölgeleri" },
                    { 2112, "Küresel ve Bölgesel Örgütler" },
                    { 2113, "Çevre ve Toplum" },
                    { 2114, "Çevre Sorunları ve Türleri" },
                    { 2115, "Madenler ve Enerji Kaynaklarının Çevreye Etkisi" },
                    { 2116, "Doğal Kaynakların Sürdürülebilir Kullanımı" },
                    { 2117, "Ekolojik Ayak İzi" },
                    { 2118, "Doğal Çevrenin Sınırlılığı" },
                    { 2119, "Çevre Politikaları" },
                    { 2120, "Çevresel Örgütler" },
                    { 2121, "Çevre Anlaşmaları" },
                    { 2122, "Doğal Afetler" },
                    { 3001, "İnanç" },
                    { 3002, "İbadet" },
                    { 3003, "Ahlak ve Değerler" },
                    { 3004, "Din, Kültür ve Medniyet" },
                    { 3005, "Hz. Mhammed (S.A.V.)" },
                    { 3006, "Vahiy ve Akıl" },
                    { 3007, "Dünya ve Ahiret" },
                    { 3008, "Kur'an'a göre Hz. Muhammed (S.A.V.)" },
                    { 3009, "İnançla İlgili Meseleler" },
                    { 3010, "Yahudilik ve Hristiyanlık" },
                    { 3011, "İslam ve Bilim" },
                    { 3012, "Anadolu da İslam" },
                    { 3013, "İslam Düşüncesinde Tasavvufi Yorumlar" },
                    { 3014, "Güncel Dini Meseler" },
                    { 3015, "Hint ve Çin Dinleri" },
                    { 3016, "Kur'an'da Bazı Kavramlar" },
                    { 3017, "Kader İnancı" },
                    { 3018, "Zekat ve Sadaka" },
                    { 3019, "Din ve Hayat" },
                    { 3020, "Hz. Muhammed'in Örnekliği" },
                    { 3021, "Kur'an-ı Kerim ve Özellikleri" },
                    { 4001, "Felsefenin Konusu" },
                    { 4002, "Bilgi Felsefesi" },
                    { 4003, "Varlık Felsefesi" },
                    { 4004, "Din, Kültür ve Medniyet" },
                    { 4005, "Ahlak Felsefesi" },
                    { 4006, "Sanat Felsefesi" },
                    { 4007, "Din Felsefesi" },
                    { 4008, "Siyaset Felsefesi" },
                    { 4009, "Bilim Felsefesi" },
                    { 4010, "İlk Çağ Felsefesi" },
                    { 4011, "MÖ 6. Yüzyıl – MS 2. Yüzyıl Felsefesi" },
                    { 4012, "MS 2. Yüzyıl – MS 15. Yüzyıl Felsefesi" },
                    { 4013, "15. Yüzyıl – 17. Yüzyıl Felsefesi" },
                    { 4014, "18. Yüzyıl – 19. Yüzyıl Felsefesi" },
                    { 4015, "20. Yüzyıl Felsefesi" },
                    { 5001, "Fizik Bilimine Giriş" },
                    { 5002, "Madde Ve Özellikleri" },
                    { 5003, "Kaldırma Kuvveti" },
                    { 5004, "Basınç" },
                    { 5005, "Isı, Sıcaklık ve Genleşme" },
                    { 5006, "Hareket ve Kuvvet" },
                    { 5007, "Dinamik" },
                    { 5008, "İş, Güç ve Enerji" },
                    { 5009, "Elektrostatik" },
                    { 5010, "Elektrik Akımı ve Devreler" },
                    { 5011, "Elektriksel Enerji ve Güç" },
                    { 5012, "Optik" },
                    { 5013, "Manyetizma" },
                    { 5014, "Dalgalar" },
                    { 5015, "Vektörler" },
                    { 5016, "Kuvvet, Tork ve Denge" },
                    { 5017, "Kütle Merkezi" },
                    { 5018, "Basit Makineler" },
                    { 5019, "Hareket" },
                    { 5020, "Newton’un Hareket Yasaları" },
                    { 5021, "İş, Güç ve Enerji II" },
                    { 5022, "Atışlar" },
                    { 5023, "İtme ve Momentum" },
                    { 5024, "Elektrik Alan ve Potansiyel" },
                    { 5025, "Paralel Levhalar ve Sığa" },
                    { 5026, "Manyetik Alan ve Manyetik Kuvvet" },
                    { 5027, "İndüksiyon, Alternatif Akım ve Transformatörler" },
                    { 5028, "Çembersel Hareket" },
                    { 5029, "Dönme, Yuvarlanma ve Açısal Momentum" },
                    { 5030, "Kütle Çekim ve Kepler Yasaları" },
                    { 5031, "Basit Harmonik Hareket" },
                    { 5032, "Dalga Mekaniği ve Elektromanyetik Dalgalar" },
                    { 5033, "Atom Modelleri" },
                    { 5034, "Büyük Patlama ve Parçacık Fiziği" },
                    { 5035, "Radyoaktivite" },
                    { 5036, "Özel Görelilik" },
                    { 5037, "Kara Cisim Işıması" },
                    { 5038, "Fotoelektrik Olay ve Compton Olayı" },
                    { 5039, "Modern Fiziğin Teknolojideki Uygulamaları" },
                    { 6001, "Geometrik Kavramlar" },
                    { 6002, "Doğruda Açılar" },
                    { 6003, "Üçgende Açılar" },
                    { 6004, "Üçgende Eşlik ve Benzerlik" },
                    { 6005, "Özel Üçgenler" },
                    { 6006, "Dik Üçgen" },
                    { 6007, "İkizkenar Üçgen" },
                    { 6008, "Eşkenar Üçgen" },
                    { 6009, "Açıortay" },
                    { 6010, "Kenarortay" },
                    { 6011, "Eşlik ve Benzerlik" },
                    { 6012, "Üçgende Alan" },
                    { 6013, "Üçgende Benzerlik" },
                    { 6014, "Üçgende Açı Kenar Bağıntıları" },
                    { 6015, "Çokgenler" },
                    { 6016, "Özel Dörtgenler" },
                    { 6017, "Dörtgenler" },
                    { 6018, "Deltoid" },
                    { 6019, "Paralelkenar" },
                    { 6020, "Eşkenar Dörtgen" },
                    { 6021, "Dikdörtgen" },
                    { 6022, "Kare" },
                    { 6023, "Yamuk" },
                    { 6024, "Çember ve Daire" },
                    { 6025, "Çemberde Açı" },
                    { 6026, "Çemberde Uzunluk" },
                    { 6027, "Dairede Çevre ve Alan" },
                    { 6028, "Analitik Geometri" },
                    { 6029, "Noktanın Anzalitiği" },
                    { 6030, "Analitik Düzlem" },
                    { 6031, "Doğrunun Grafiğinin Çizimi" },
                    { 6032, "Doğrunun Denklemleri" },
                    { 6033, "Doğrunun Analitiği" },
                    { 6034, "Simetriler" },
                    { 6035, "Eşitsizlikler" },
                    { 6036, "Dönüşüm Geometrisi" },
                    { 6037, "Katı Cisimler" },
                    { 6038, "Prizmalar" },
                    { 6039, "Dikdörtgenler Prizmalar" },
                    { 6040, "Küp" },
                    { 6041, "Silindir" },
                    { 6042, "Dönel Silindir" },
                    { 6043, "Kesik Piramit" },
                    { 6044, "Piramit" },
                    { 6045, "Koni" },
                    { 6046, "Küre" },
                    { 6047, "Çemberin Analitiği" },
                    { 7001, "Kimya Bilimi" },
                    { 7002, "Atom ve Yapısı" },
                    { 7003, "Periyodik Sistem" },
                    { 7004, "Kimyasal Türler Arası Etkileşimler" },
                    { 7005, "Maddenin Halleri" },
                    { 7006, "Kimyanın Temel Kanunları" },
                    { 7007, "Asitler, Bazlar ve Tuzlar" },
                    { 7008, "Kimyasal Hesaplamalar" },
                    { 7009, "Karışımlar" },
                    { 7010, "Endüstride ve Canlılarda Enerji" },
                    { 7011, "Kimya Her Yerde" },
                    { 7012, "Modern Atom Teorisi." },
                    { 7013, "Gazlar" },
                    { 7014, "Sıvı Çözeltiler ve Çözünürlük." },
                    { 7015, "Kimyasal Tepkimelerde Enerji" },
                    { 7016, "Kimyasal Tepkimelerde Hız" },
                    { 7017, "Kimyasal Tepkimelerde Denge" },
                    { 7018, "Asit-Baz Dengesi" },
                    { 7019, "Çözünürlük Dengesi" },
                    { 7020, "Kimya ve Elektrik" },
                    { 7021, "Organik Kimyaya Giriş" },
                    { 7022, "Organik Kimya" },
                    { 7023, "Hidrokarbonlar" },
                    { 7024, "Fonksiyonel Gruplar" },
                    { 7025, "Enerji Kaynakları ve Bilimsel Gelişmeler" },
                    { 8001, "İslamiyet Öncesi Türk Tarihi" },
                    { 8002, "İlk Türk - İslam Devletleri ve Beylikleri" },
                    { 8003, "Osmanlı Devleti Kuruluş ve Yükselme Dönemleri" },
                    { 8004, "Osmanlı Devleti’nde Kültür ve Uygarlık" },
                    { 8005, "XVII. Yüzyılda Osmanlı Devleti (Duraklama Dönemi)" },
                    { 8006, "XVIII. Yüzyılda Osmanlı Devleti (Gerileme Dönemi)" },
                    { 8007, "XIX. Yüzyılda Osmanlı Devleti (Dağılma Dönemi)" },
                    { 8008, "XX. Yüzyılda Osmanlı Devleti" },
                    { 8009, "Kurtuluş Savaşı Hazırlık Dönemi" },
                    { 8010, "I. TBMM Dönemi" },
                    { 8011, "Kurtuluş Savaşı Muharebeler Dönemi" },
                    { 8012, "Atatürk İnkılapları" },
                    { 8013, "Atatürk İlkeleri" },
                    { 8014, "Partiler ve Partileşme Dönemi (İç Politika)" },
                    { 8015, "Atatürk Dönemi Türk Dış Politikası" },
                    { 8016, "Atatürk Sonrası Dönem" },
                    { 8017, "Atatürk’ün Hayatı ve Kişiliği" },
                    { 8018, "Tarih ve Zaman" },
                    { 8019, "İnsanlığın İlk Dönemleri" },
                    { 8020, "Ortaçağ’da Dünya" },
                    { 8021, "İlk ve Orta Çağlarda Türk Dünyası" },
                    { 8022, "İslam Medeniyetinin Doğuşu" },
                    { 8023, "Türklerin İslamiyet’i Kabulü ve İlk Türk İslam Devletleri" },
                    { 8024, "Yerleşme ve Devletleşme Sürecinde Selçuklu Türkiyesi" },
                    { 8025, "Beylikten Devlete Osmanlı Siyaseti" },
                    { 8026, "Devletleşme Sürecinde Savaşçılar ve Askerler" },
                    { 8027, "Dünya Gücü Osmanlı Devleti" },
                    { 8028, "Yeni Çağ Avrupa Tarihi" },
                    { 8029, "Yakın Çağ Avrupa Tarihi" },
                    { 8030, "Osmanlı Devletinde Arayış Yılları" },
                    { 8031, "18. Yüzyılda Değişim ve Diplomasi" },
                    { 8032, "En Uzun Yüzyıl" },
                    { 8033, "Osmanlı Kültür ve Medeniyeti" },
                    { 8034, "20. Yüzyılda Osmanlı Devleti" },
                    { 8035, "I. Dünya Savaşı" },
                    { 8036, "Mondros Ateşkesi, İşgaller ve Cemiyetler" },
                    { 8037, "Kurtuluş Savaşına Hazırlık Dönemi" },
                    { 8038, "I. TBMM Dönemi" },
                    { 8039, "Kurtuluş Savaşı ve Antlaşmalar" },
                    { 8040, "II. TBMM Dönemi ve Çok Partili Hayata Geçiş" },
                    { 8041, "Türk İnkılabı" },
                    { 8042, "Atatürk İlkeleri" },
                    { 8043, "Atatürk Dönemi Türk Dış Politikası" },
                    { 8044, "Sultan ve Osmanlı Merkez Teşkilatı" },
                    { 8045, "Klasik Çağda Osmanlı Toplum Düzeni" },
                    { 8046, "Değişen Dünya Dengeleri Karşısında Osmanlı Siyaseti" },
                    { 8047, "Değişim Çağında Avrupa ve Osmanlı" },
                    { 8048, "Uluslararası İlişkilerde Denge Stratejisi (1774-1914)" },
                    { 8049, "Devrimler Çağında Değişen Devlet-Toplum İlişkileri" },
                    { 8050, "Sermaye ve Emek" },
                    { 8051, "XIX. ve XX. Yüzyılda Değişen Gündelik Hayat" },
                    { 8052, "XX. Yüzyıl Başlarında Osmanlı Devleti ve Dünya" },
                    { 8053, "Milli Mücadele" },
                    { 8054, "Atatürkçülük ve Türk İnkılabı" },
                    { 8055, "İki Savaş Arasındaki Dönemde Türkiye ve Dünya" },
                    { 8056, "II. Dünya Savaşı Sürecinde Türkiye ve Dünya" },
                    { 8057, "II. Dünya Savaşı Sonrasında Türkiye ve Dünya" },
                    { 8058, "Toplumsal Devrim Çağında Dünya ve Türkiye" },
                    { 8059, "XXI. Yüzyılın Eşiğinde Türkiye ve Dünya" },
                    { 9001, "Sözcükte Anlam" },
                    { 9002, "Sözcükte Anlam - Söz Öbekleri" },
                    { 9003, "Söz Sanatları" },
                    { 9004, "Sözcükte Yapı" },
                    { 9005, "Sözcük Türleri" },
                    { 9006, "Sözcük Türleri - Ad (İsim)" },
                    { 9007, "Sözcük Türleri - Adıl (Zamir)" },
                    { 9008, "Sözcük Türleri - Önad (Sıfat)" },
                    { 9009, "Sözcük Türleri - Belirteç (Zarf)" },
                    { 9010, "Sözcük Türleri - İlgeç (Edat)" },
                    { 9011, "Sözcük Türleri - Bağlaç" },
                    { 9012, "Sözcük Türleri - Ünlem" },
                    { 9013, "Sözcük Türleri - Fiil (Eylem)" },
                    { 9014, "Cümlede Anlam" },
                    { 9015, "Cümle yorumlama" },
                    { 9016, "Paragrafta (Parçada) Anlam" },
                    { 9017, "Paragrafta Anlam - Paragrafın Ana Düşüncesi" },
                    { 9018, "Paragrafta Anlam - Paragrafta Yardımcı Düşünceler" },
                    { 9019, "Paragrafta Anlam - Paragrafın Konusu" },
                    { 9020, "Paragrafta Anlam - Paragrafın Başlığı" },
                    { 9021, "Paragrafta Anlam - Paragrafın Anahtar Kelimesi" },
                    { 9022, "Paragrafta Anlam - Paragraf Tamamlama" },
                    { 9023, "Paragrafta Anlam - Paragrafı İkiye Bölme" },
                    { 9024, "Paragrafta Anlam - Paragrafın Akışını Bozan Cümle" },
                    { 9025, "Paragrafta Anlam - Paragrata Anlatım Teknikleri" },
                    { 9026, "Paragrafta Anlam - Paragrata Düşünceyi Geliştirme Yolları" },
                    { 9027, "Paragrafta Anlam - Paragrafın Anlatıcı Bakış Açıları" },
                    { 9028, "Yazım Kuralları" },
                    { 9029, "Yazım Kuralları - Büyük Harflerin Yazımı" },
                    { 9030, "Yazım Kuralları - Küçük Harf Yazımı" },
                    { 9031, "Yazım Kuralları - Kelime ve Söz Gruplarının Yazımı" },
                    { 9032, "Yazım Kuralları - Bağlaçların Yazımı" },
                    { 9033, "Yazım Kuralları - Kısaltmaların Yazımı" },
                    { 9034, "Yazım Kuralları - Sayıların Yazımı" },
                    { 9035, "Yazım Kuralları - Yabancı Kelimelerin Yazımı" },
                    { 9036, "Yazım Kuralları - Özel İsimlerin Yazımı" },
                    { 9037, "Yazım Kuralları - Birleşik Kelimelerin Yazımı" },
                    { 9038, "Yazım Kuralları - Bitişik Yazılan Birleşik Kelimeler" },
                    { 9039, "Yazım Kuralları - Ayrı Yazılan Birleşik Kelimeler" },
                    { 9040, "Yazım Kuralları - \"de/da\" Bağlacının Yazımı" },
                    { 9041, "Yazım Kuralları - \"ki\" Bağlacının Yazımı" },
                    { 9042, "Yazım Kuralları - \"mi\" ” Soru Ekinin Yazımı" },
                    { 9043, "Yazım Kuralları - \"ne … ne …\" Bağlacının Yazımı" },
                    { 9044, "Yazım Kuralları - Pekiştirmelerin Yazımı" },
                    { 9045, "Yazım Kuralları - İkilemelerin Yazımı" },
                    { 9046, "Metin Türleri (Edebi Türler)" },
                    { 9047, "Ses Bilgisi" },
                    { 9048, "Ses Bilgisi - Ses Olayları" },
                    { 9049, "Ses Bilgisi - Ünsüz Sertleşmesi (Ünsüz Benzeşmesi)" },
                    { 9050, "Ses Bilgisi - Ünsüz Yumuşaması (Sessiz Yumuşaması)" },
                    { 9051, "Ses Bilgisi - Ses Düşmesi" },
                    { 9052, "Ses Bilgisi - Ünlü Düşmesi" },
                    { 9053, "Ses Bilgisi - Ünsüz Düşmesi" },
                    { 9054, "Ses Bilgisi - Ses Türemesi" },
                    { 9055, "Ses Bilgisi - Ünlü Türemesi" },
                    { 9056, "Ses Bilgisi - Ünsüz Türemesi" },
                    { 9057, "Ses Bilgisi - Ünlü Daralması" },
                    { 9058, "Ses Bilgisi - Ulama" },
                    { 9059, "Ses Bilgisi - Kaynaşma" },
                    { 9060, "Ses Bilgisi - Ünlü Uyumları" },
                    { 9061, "Noktalama İşaretleri" },
                    { 9062, "Noktalama İşaretleri - Nokta \".\"" },
                    { 9063, "Noktalama İşaretleri - Virgül \",\"" },
                    { 9064, "Noktalama İşaretleri - Noktalı Virgül \";\"" },
                    { 9065, "Noktalama İşaretleri - İki Nokta \":\"" },
                    { 9066, "Noktalama İşaretleri - Üç Nokta \"...\"" },
                    { 9067, "Noktalama İşaretleri - Soru İşareti \"?\"" },
                    { 9068, "Noktalama İşaretleri - Ünlem İşareti \"!\"" },
                    { 9069, "Noktalama İşaretleri - Tırnak İşareti \"” “\"" },
                    { 9070, "Noktalama İşaretleri - Kesme İşareti \"'\"" },
                    { 9071, "Anlatım Bozuklukları" },
                    { 9072, "Fiilimsiler (Eylemsiler)" },
                    { 9073, "Fiilimsiler (Eylemsiler) - İsim Fiil (Mastar)" },
                    { 9074, "Fiilimsiler (Eylemsiler) - Sıfat Fiil (Ortaç)" },
                    { 9075, "Fiilimsiler (Eylemsiler) - Zarf-Fiil (Ulaç)" },
                    { 9076, "Fiilde (Eylemde) Çatı" },
                    { 9077, "Fiiller" },
                    { 9078, "Fiiller - Anlamlarına Göre Fiiller" },
                    { 9079, "Fiiller - Yapılarına Göre Fiiller" },
                    { 9080, "Fiiller - İş (Kılış) Fiilleri" },
                    { 9081, "Fiiller - Durum Fiilleri" },
                    { 9082, "Fiiller - Oluş Fiilleri" },
                    { 9083, "Fiiller - Basit Fiiller" },
                    { 9084, "Fiiller - Türemiş Fiiller" },
                    { 9085, "Fiiller - Birleşik Fiiller" },
                    { 9086, "Fiiller - Kurallı Birleşik Fiiller" },
                    { 9087, "Fiiller - Yardımcı Eylemle Kurulan Birleşik Fiiller" },
                    { 9088, "Fiiller - Anlamca Kaynaşmış Birleşik Fiiller" },
                    { 9089, "Fiil Çekimi" },
                    { 9090, "Fiil Çekimi - Haber Kipleri" },
                    { 9091, "Fiil Çekimi - Dilek Kipleri" },
                    { 9092, "Ek Fiil" },
                    { 9093, "Cümlenin Ögeleri" },
                    { 9094, "Cümle Türleri" },
                    { 9095, "Sözel Mantık" },
                    { 9096, "Görsel Okuma" },
                    { 9097, "Söz Yorumu" },
                    { 9098, "Deyimler ve Atasözleri" },
                    { 10001, "Anlam Bilgisi" },
                    { 10002, "Dil Bilgisi" },
                    { 10003, "Güzel Sanatlar ve Edebiyat" },
                    { 10004, "Metinlerin Sınıflandırılması" },
                    { 10005, "Şiir Bilgisi" },
                    { 10006, "Edebi Sanatlar" },
                    { 10007, "Türk Edebiyatı Dönemleri" },
                    { 10008, "İslamiyet Öncesi Türk Edebiyatı ve Geçiş Dönemi" },
                    { 10009, "Halk Edebiyatı" },
                    { 10010, "Divan Edebiyatı" },
                    { 10011, "Tanzimat Edebiyatı" },
                    { 10012, "Servet-i Fünun Edebiyatı" },
                    { 10013, "Fecr-i Ati Edebiyatı" },
                    { 10014, "Milli Edebiyat" },
                    { 10015, "Cumhuriyet Dönemi Edebiyatı" },
                    { 10016, "Edebiyat Akımları" },
                    { 10017, "Dünya Edebiyatı" },
                    { 11001, "Mantığa Giriş" },
                    { 11002, "Mantığa Giriş" },
                    { 11003, "Klasik Mantık" },
                    { 11004, "Mantık ve Dil" },
                    { 11005, "Sembolik Mantık" },
                    { 12001, "Psikoloji Bilimini Tanıyalım" },
                    { 12002, "Psikolojinin Temel Süreçleri" },
                    { 12003, "Öğrenme Bellek Düşünme" },
                    { 12004, "Ruh Sağlığının Temelleri" },
                    { 13001, "Sosyolojiye Giriş" },
                    { 13002, "Birey ve Toplum" },
                    { 13003, "Toplumsal Yapı" },
                    { 13004, "Toplumsal Değişme ve Gelişme" },
                    { 13005, "Toplum ve Kültür" },
                    { 13006, "Toplumsal Kurumlar" },
                    { 14001, "Bir Kahraman Doğuyor" },
                    { 14002, "Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar" },
                    { 14003, "Milli Bir Destan: Ya İstiklal, Ya Ölüm" },
                    { 14004, "Atatürkçülük ve Çağdaşlaşan Türkiye" },
                    { 14005, "Demokratikleşme Çabaları" },
                    { 14006, "Atatürk Dönemi Dış Politika" },
                    { 14007, "Atatürk’ün Ölümü ve Sonrası" },
                    { 15001, "Friendship" },
                    { 15002, "Teen Life" },
                    { 15003, "In The Kitchen" },
                    { 15004, "On The Phone" },
                    { 15005, "The Internet" },
                    { 15006, "Adventures" },
                    { 15007, "Tourism" },
                    { 15008, "Chores" },
                    { 15009, "Science" },
                    { 15010, "Natural Forces" },
                    { 16001, "Mevsimler ve iklimler" },
                    { 16002, "DNA ve Genetik Kod" },
                    { 16003, "Basınç" },
                    { 16004, "Madde ve EndüstriPeriyodik Sistem" },
                    { 16005, "Fiziksel ve Kimyasal Değişimler" },
                    { 16006, "Asitler ve Bazlar" },
                    { 16007, "Madde ve Endüstri" },
                    { 16008, "Basit Makineler" },
                    { 16009, "Canlılar ve Enerji İlişkileri" },
                    { 16010, "Enerji Dönüşümleri ve Çevre Bilimi" },
                    { 16011, "Elektrik Yükleri ve Elektrik Enerjisi" },
                    { 17001, "Hukukun Temel Kavramları" },
                    { 17002, "Hukukun Temel Kavramları - Hukukun Tanımı" },
                    { 17003, "Hukukun Temel Kavramları - Hukuk Kaynaklarıyla İlgili Kavramlar" },
                    { 17004, "Hukukun Temel Kavramları - Yazısız Kaynaklar (Örf Ve Adet Hukuku)" },
                    { 17005, "Hukukun Temel Kavramları - Yardımcı Kaynaklar" },
                    { 17006, "Hukukun Temel Kavramları - Hukuk Kurallarının Yaptırımları" },
                    { 17007, "Hukukun Temel Kavramları - Kamu Hukuku Dalları" },
                    { 17008, "Hukukun Temel Kavramları - Ceza Ve Ehliyet" },
                    { 17009, "Hukukun Temel Kavramları - Özel Hukuk Dalları" },
                    { 17010, "Hukukun Temel Kavramları - Hakkın Tanımı Ve Türleri" },
                    { 17011, "Devlet Biçimleri Ve Hükümet Sistemleri" },
                    { 17012, "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kavramı" },
                    { 17013, "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kurucu Unsurları" },
                    { 17014, "Devlet Biçimleri Ve Hükümet Sistemleri - Devlet Kavramına İlişkin Ayrımlar" },
                    { 17015, "Devlet Biçimleri Ve Hükümet Sistemleri - Yapılarına Göre Devlet Şekilleri" },
                    { 17016, "Devlet Biçimleri Ve Hükümet Sistemleri - Egemenliğin Kaynağına Göre Devlet Şekilleri" },
                    { 17017, "Devlet Biçimleri Ve Hükümet Sistemleri - Hükümet Sistemleri" },
                    { 17018, "Anayasa Hukukuna Giriş, Temel Kavramlar Ve Türk Anayasa Tarihi" },
                    { 17019, "Anayasa Hukukuna Giriş - Anayasa" },
                    { 17020, "Anayasa Hukukuna Giriş - Anayasa Kavramına İlişkin Ayrımlar" },
                    { 17021, "Anayasa Hukukuna Giriş - Yazılı Anayasa - Yazısız Anayasa Ayrımı" },
                    { 17022, "Anayasa Hukukuna Giriş - Türk Anayasa Tarih" },
                    { 17023, "Anayasa Hukukuna Giriş - Kanun-U Esasî (1876)" },
                    { 17024, "Anayasa Hukukuna Giriş - Kanun-U Esasî’de 1909 Değişiklikleri (İkinci Meşrutiyet)" },
                    { 17025, "Anayasa Hukukuna Giriş - 1921 Teşkilât-I Esasiye Kanunu" },
                    { 17026, "Anayasa Hukukuna Giriş - Teşkilat-I Esasiye Kanunu’nda 29 Ekim 1923 Tarihli Değişiklikler" },
                    { 17027, "Anayasa Hukukuna Giriş - 1924 Anayasası" },
                    { 17028, "Anayasa Hukukuna Giriş - 1961 Anayasası" },
                    { 17029, "Anayasa Hukukuna Giriş - 1971-1973 Anayasa Değişiklikleri" },
                    { 17030, "Anayasa Hukukuna Giriş - 1982 Anayasası" },
                    { 17031, "Anayasa Hukukuna Giriş - 1982 Anayasasının Temel Özellikleri" },
                    { 17032, "Anayasa Hukukuna Giriş - 2017 Anayasasının Temel Özellikleri" },
                    { 17033, "Anayasa Hukukuna Giriş - Türk Tarihindeki Referandumlar" },
                    { 17034, "Anayasa Hukukuna Giriş - 1982 Anayasası’nın Temel İlkeleri" },
                    { 17035, "Yasama" },
                    { 17036, "Yasama - Yasama Organı" },
                    { 17037, "Yasama - Yasama İşlemleri" },
                    { 17038, "Yasama - Tbmm İç Yapı Ve Çalışma Düzeni" },
                    { 17039, "Yasama - Toplantı Ve Karar Yeter Sayısı" },
                    { 17040, "Yasama - Tbmm Görev Ve Yetkileri" },
                    { 17041, "Yasama - Tbmm Bilgi Edinme Ve Denetim Yolları" },
                    { 17042, "Yürütme" },
                    { 17043, "Yürütme - Kanun Hükmünde Kararnameler" },
                    { 17044, "Yürütme - Cumhurbaşkanlığı Kararnamesi" },
                    { 17045, "Yürütme - Yönetmelik" },
                    { 17046, "Yürütme - Cumhurbaşkanı’nın Görev Ve Yetkileri" },
                    { 17047, "Yargı" },
                    { 17048, "Yargı - Yargı Organı" },
                    { 17049, "Yargı - Hakimler Ve Savcılar Kurulu" },
                    { 17050, "Yargı - Yüksek Mahkemeler" },
                    { 17051, "Yargı - Anayasa Mahkemesi" },
                    { 17052, "Yargı - Yargıtay" },
                    { 17053, "Yargı - Danıştay" },
                    { 17054, "Yargı - Uyuşmazlık Mahkemesi" },
                    { 17055, "Yargı - Sayıştay" },
                    { 17056, "Temel Hak Ve Hürriyetler" },
                    { 17057, "Temel Hak Ve Hürriyetler - Temel Hakların Türleri" },
                    { 17058, "İdare Hukuku" },
                    { 17059, "İdare Hukuku - İdare (Kamu Yönetimi)" },
                    { 17060, "İdare Hukuku - Yerel Yönetim Organları" },
                    { 17061, "İdare Hukuku - Kamu Kuruluşları" },
                    { 17062, "İdare Hukuku - Kamu Kuruluşları" },
                    { 18001, "Uluslararası Kuruluşlar Ve Güncel Olaylar" },
                    { 18002, "Uluslararası Örgüt Ve Kuruluşlar" },
                    { 18003, "Kpss Güncel Bilgiler" },
                    { 18004, "Türkiye’ye Vize Uygulamayan Ülkeler" },
                    { 18005, "Unesco’nun Dünya Mirası Listesindeki Doğal Ve Kültürel Varlıklarımız" }
                });

            migrationBuilder.InsertData(
                table: "Subjects",
                columns: new[] { "Id", "ExamId", "Name" },
                values: new object[,]
                {
                    { 1, 1, "TYT - Türkçe" },
                    { 2, 1, "TYT - Tarih" },
                    { 3, 1, "TYT - Coğrafya" },
                    { 4, 1, "TYT - Felsefe" },
                    { 5, 1, "TYT - Din Kültürü ve Ahlâk Bilgisi" },
                    { 6, 1, "TYT - Matematik" },
                    { 7, 1, "TYT - Geometri" },
                    { 8, 1, "TYT - Fizik" },
                    { 9, 1, "TYT - Kimya" },
                    { 10, 1, "TYT - Biyoloji" },
                    { 101, 2, "AYT - Matematik" },
                    { 102, 2, "AYT - Geometri" },
                    { 103, 2, "AYT - Fizik" },
                    { 104, 2, "AYT - Kimya" },
                    { 105, 2, "AYT - Biyoloji " },
                    { 106, 2, "AYT - Coğrafya " },
                    { 107, 2, "AYT - Tarih " },
                    { 108, 2, "AYT - Türk Dili ve Edebiyatı" },
                    { 109, 2, "AYT - Din Kültürü ve Ahlâk Bilgisi" },
                    { 110, 2, "AYT - Felsefe" },
                    { 111, 2, "AYT - Psikoloji" },
                    { 112, 2, "AYT - Sosyoloji" },
                    { 113, 2, "AYT - Mantık" },
                    { 201, 3, "Lgs - Türkçe" },
                    { 202, 3, "Lgs - İnkılâp Tarihi ve Atatürkçülük" },
                    { 203, 3, "Lgs - Din Kültürü ve Ahlâk Bilgisi" },
                    { 204, 3, "Lgs - İngilizce" },
                    { 205, 3, "Lgs - Fen Bilimleri" },
                    { 206, 3, "Lgs - Matematik" },
                    { 301, 4, "KPSS - Türkçe" },
                    { 302, 4, "KPSS - Matematik" },
                    { 303, 4, "KPSS - Geometri" },
                    { 304, 4, "KPSS - Tarih" },
                    { 305, 4, "KPSS - Coğrafya" },
                    { 306, 4, "KPSS - Vatandaşlık" },
                    { 307, 4, "KPSS - Güncel Bilgiler" }
                });

            migrationBuilder.InsertData(
                table: "SubjectTopic",
                columns: new[] { "SubjectId", "TopicId" },
                values: new object[,]
                {
                    { 1, 9001 },
                    { 1, 9002 },
                    { 1, 9003 },
                    { 1, 9004 },
                    { 1, 9005 },
                    { 1, 9006 },
                    { 1, 9007 },
                    { 1, 9008 },
                    { 1, 9009 },
                    { 1, 9010 },
                    { 1, 9011 },
                    { 1, 9012 },
                    { 1, 9013 },
                    { 1, 9014 },
                    { 1, 9015 },
                    { 1, 9016 },
                    { 1, 9017 },
                    { 1, 9018 },
                    { 1, 9019 },
                    { 1, 9020 },
                    { 1, 9021 },
                    { 1, 9022 },
                    { 1, 9023 },
                    { 1, 9024 },
                    { 1, 9025 },
                    { 1, 9026 },
                    { 1, 9027 },
                    { 1, 9028 },
                    { 1, 9029 },
                    { 1, 9030 },
                    { 1, 9031 },
                    { 1, 9032 },
                    { 1, 9033 },
                    { 1, 9034 },
                    { 1, 9035 },
                    { 1, 9036 },
                    { 1, 9037 },
                    { 1, 9038 },
                    { 1, 9039 },
                    { 1, 9040 },
                    { 1, 9041 },
                    { 1, 9042 },
                    { 1, 9043 },
                    { 1, 9044 },
                    { 1, 9045 },
                    { 1, 9046 },
                    { 1, 9047 },
                    { 1, 9048 },
                    { 1, 9049 },
                    { 1, 9050 },
                    { 1, 9051 },
                    { 1, 9052 },
                    { 1, 9053 },
                    { 1, 9054 },
                    { 1, 9055 },
                    { 1, 9056 },
                    { 1, 9057 },
                    { 1, 9058 },
                    { 1, 9059 },
                    { 1, 9060 },
                    { 1, 9061 },
                    { 1, 9062 },
                    { 1, 9063 },
                    { 1, 9064 },
                    { 1, 9065 },
                    { 1, 9066 },
                    { 1, 9067 },
                    { 1, 9068 },
                    { 1, 9069 },
                    { 1, 9070 },
                    { 1, 9071 },
                    { 1, 9072 },
                    { 1, 9073 },
                    { 1, 9074 },
                    { 1, 9075 },
                    { 1, 9076 },
                    { 1, 9077 },
                    { 1, 9078 },
                    { 1, 9079 },
                    { 1, 9080 },
                    { 1, 9081 },
                    { 1, 9082 },
                    { 1, 9083 },
                    { 1, 9084 },
                    { 1, 9085 },
                    { 1, 9086 },
                    { 1, 9087 },
                    { 1, 9088 },
                    { 1, 9089 },
                    { 1, 9090 },
                    { 1, 9091 },
                    { 1, 9092 },
                    { 1, 9093 },
                    { 1, 9094 },
                    { 1, 9095 },
                    { 1, 9096 },
                    { 1, 9097 },
                    { 1, 9098 },
                    { 2, 8018 },
                    { 2, 8019 },
                    { 2, 8020 },
                    { 2, 8021 },
                    { 2, 8022 },
                    { 2, 8023 },
                    { 2, 8024 },
                    { 2, 8025 },
                    { 2, 8026 },
                    { 2, 8027 },
                    { 2, 8028 },
                    { 2, 8029 },
                    { 2, 8030 },
                    { 2, 8031 },
                    { 2, 8032 },
                    { 2, 8033 },
                    { 2, 8034 },
                    { 2, 8035 },
                    { 2, 8036 },
                    { 2, 8037 },
                    { 2, 8038 },
                    { 2, 8039 },
                    { 2, 8040 },
                    { 2, 8041 },
                    { 2, 8042 },
                    { 2, 8043 },
                    { 3, 2061 },
                    { 3, 2062 },
                    { 3, 2063 },
                    { 3, 2064 },
                    { 3, 2065 },
                    { 3, 2066 },
                    { 3, 2067 },
                    { 3, 2068 },
                    { 3, 2069 },
                    { 3, 2070 },
                    { 3, 2071 },
                    { 3, 2072 },
                    { 3, 2073 },
                    { 3, 2074 },
                    { 3, 2075 },
                    { 3, 2076 },
                    { 3, 2077 },
                    { 3, 2078 },
                    { 3, 2079 },
                    { 4, 4001 },
                    { 4, 4002 },
                    { 4, 4003 },
                    { 4, 4004 },
                    { 4, 4005 },
                    { 4, 4006 },
                    { 4, 4007 },
                    { 4, 4008 },
                    { 4, 4009 },
                    { 5, 3001 },
                    { 5, 3002 },
                    { 5, 3003 },
                    { 5, 3004 },
                    { 5, 3005 },
                    { 5, 3006 },
                    { 5, 3007 },
                    { 5, 3008 },
                    { 5, 3009 },
                    { 5, 3010 },
                    { 5, 3011 },
                    { 5, 3012 },
                    { 5, 3013 },
                    { 5, 3014 },
                    { 5, 3015 },
                    { 5, 3016 },
                    { 6, 1 },
                    { 6, 2 },
                    { 6, 3 },
                    { 6, 4 },
                    { 6, 5 },
                    { 6, 6 },
                    { 6, 7 },
                    { 6, 8 },
                    { 6, 9 },
                    { 6, 10 },
                    { 6, 11 },
                    { 6, 12 },
                    { 6, 13 },
                    { 6, 14 },
                    { 6, 15 },
                    { 6, 16 },
                    { 6, 17 },
                    { 6, 18 },
                    { 6, 19 },
                    { 6, 20 },
                    { 6, 21 },
                    { 6, 22 },
                    { 6, 23 },
                    { 6, 24 },
                    { 6, 25 },
                    { 6, 26 },
                    { 6, 27 },
                    { 6, 28 },
                    { 6, 29 },
                    { 6, 30 },
                    { 6, 31 },
                    { 6, 32 },
                    { 6, 33 },
                    { 6, 34 },
                    { 6, 35 },
                    { 6, 36 },
                    { 6, 37 },
                    { 6, 38 },
                    { 6, 39 },
                    { 6, 40 },
                    { 6, 41 },
                    { 6, 42 },
                    { 6, 43 },
                    { 6, 44 },
                    { 6, 45 },
                    { 6, 46 },
                    { 6, 47 },
                    { 6, 48 },
                    { 6, 49 },
                    { 6, 50 },
                    { 6, 51 },
                    { 6, 52 },
                    { 6, 53 },
                    { 7, 6001 },
                    { 7, 6002 },
                    { 7, 6003 },
                    { 7, 6004 },
                    { 7, 6005 },
                    { 7, 6006 },
                    { 7, 6007 },
                    { 7, 6008 },
                    { 7, 6009 },
                    { 7, 6010 },
                    { 7, 6011 },
                    { 7, 6012 },
                    { 7, 6013 },
                    { 7, 6014 },
                    { 7, 6015 },
                    { 7, 6016 },
                    { 7, 6017 },
                    { 7, 6018 },
                    { 7, 6019 },
                    { 7, 6020 },
                    { 7, 6021 },
                    { 7, 6022 },
                    { 7, 6023 },
                    { 7, 6024 },
                    { 7, 6025 },
                    { 7, 6026 },
                    { 7, 6027 },
                    { 7, 6028 },
                    { 7, 6029 },
                    { 7, 6030 },
                    { 7, 6031 },
                    { 7, 6032 },
                    { 7, 6033 },
                    { 7, 6034 },
                    { 7, 6035 },
                    { 7, 6036 },
                    { 7, 6037 },
                    { 7, 6038 },
                    { 7, 6039 },
                    { 7, 6040 },
                    { 7, 6041 },
                    { 7, 6042 },
                    { 7, 6043 },
                    { 7, 6044 },
                    { 7, 6045 },
                    { 7, 6046 },
                    { 7, 6047 },
                    { 8, 5001 },
                    { 8, 5002 },
                    { 8, 5003 },
                    { 8, 5004 },
                    { 8, 5005 },
                    { 8, 5006 },
                    { 8, 5007 },
                    { 8, 5008 },
                    { 8, 5009 },
                    { 8, 5010 },
                    { 8, 5011 },
                    { 8, 5012 },
                    { 8, 5013 },
                    { 8, 5014 },
                    { 9, 7001 },
                    { 9, 7002 },
                    { 9, 7003 },
                    { 9, 7004 },
                    { 9, 7005 },
                    { 9, 7006 },
                    { 9, 7007 },
                    { 9, 7008 },
                    { 9, 7009 },
                    { 9, 7010 },
                    { 9, 7011 },
                    { 10, 1001 },
                    { 10, 1002 },
                    { 10, 1003 },
                    { 10, 1004 },
                    { 10, 1005 },
                    { 10, 1006 },
                    { 10, 1007 },
                    { 10, 1008 },
                    { 101, 1 },
                    { 101, 2 },
                    { 101, 3 },
                    { 101, 4 },
                    { 101, 5 },
                    { 101, 6 },
                    { 101, 7 },
                    { 101, 8 },
                    { 101, 9 },
                    { 101, 10 },
                    { 101, 11 },
                    { 101, 12 },
                    { 101, 13 },
                    { 101, 14 },
                    { 101, 15 },
                    { 101, 16 },
                    { 101, 17 },
                    { 101, 18 },
                    { 101, 19 },
                    { 101, 20 },
                    { 101, 21 },
                    { 101, 22 },
                    { 101, 23 },
                    { 101, 24 },
                    { 101, 25 },
                    { 101, 26 },
                    { 101, 27 },
                    { 101, 28 },
                    { 101, 29 },
                    { 101, 30 },
                    { 101, 31 },
                    { 101, 32 },
                    { 101, 33 },
                    { 101, 34 },
                    { 101, 35 },
                    { 101, 36 },
                    { 101, 37 },
                    { 101, 38 },
                    { 101, 39 },
                    { 101, 40 },
                    { 101, 41 },
                    { 101, 42 },
                    { 101, 43 },
                    { 101, 44 },
                    { 101, 45 },
                    { 101, 46 },
                    { 101, 47 },
                    { 101, 48 },
                    { 101, 49 },
                    { 101, 50 },
                    { 101, 51 },
                    { 101, 52 },
                    { 101, 53 },
                    { 101, 54 },
                    { 101, 55 },
                    { 101, 56 },
                    { 101, 57 },
                    { 101, 58 },
                    { 101, 59 },
                    { 101, 60 },
                    { 101, 61 },
                    { 101, 62 },
                    { 102, 6001 },
                    { 102, 6002 },
                    { 102, 6003 },
                    { 102, 6004 },
                    { 102, 6005 },
                    { 102, 6006 },
                    { 102, 6007 },
                    { 102, 6008 },
                    { 102, 6009 },
                    { 102, 6010 },
                    { 102, 6011 },
                    { 102, 6012 },
                    { 102, 6013 },
                    { 102, 6014 },
                    { 102, 6015 },
                    { 102, 6016 },
                    { 102, 6017 },
                    { 102, 6018 },
                    { 102, 6019 },
                    { 102, 6020 },
                    { 102, 6021 },
                    { 102, 6022 },
                    { 102, 6023 },
                    { 102, 6024 },
                    { 102, 6025 },
                    { 102, 6026 },
                    { 102, 6027 },
                    { 102, 6028 },
                    { 102, 6029 },
                    { 102, 6030 },
                    { 102, 6031 },
                    { 102, 6032 },
                    { 102, 6033 },
                    { 102, 6034 },
                    { 102, 6035 },
                    { 102, 6036 },
                    { 102, 6037 },
                    { 102, 6038 },
                    { 102, 6039 },
                    { 102, 6040 },
                    { 102, 6041 },
                    { 102, 6042 },
                    { 102, 6043 },
                    { 102, 6044 },
                    { 102, 6045 },
                    { 102, 6046 },
                    { 102, 6047 },
                    { 103, 5015 },
                    { 103, 5016 },
                    { 103, 5017 },
                    { 103, 5018 },
                    { 103, 5019 },
                    { 103, 5020 },
                    { 103, 5021 },
                    { 103, 5022 },
                    { 103, 5023 },
                    { 103, 5024 },
                    { 103, 5025 },
                    { 103, 5026 },
                    { 103, 5027 },
                    { 103, 5028 },
                    { 103, 5029 },
                    { 103, 5030 },
                    { 103, 5031 },
                    { 103, 5032 },
                    { 103, 5033 },
                    { 103, 5034 },
                    { 103, 5035 },
                    { 103, 5036 },
                    { 103, 5037 },
                    { 103, 5038 },
                    { 103, 5039 },
                    { 104, 7001 },
                    { 104, 7002 },
                    { 104, 7003 },
                    { 104, 7004 },
                    { 104, 7005 },
                    { 104, 7006 },
                    { 104, 7007 },
                    { 104, 7008 },
                    { 104, 7009 },
                    { 104, 7010 },
                    { 104, 7011 },
                    { 104, 7012 },
                    { 104, 7013 },
                    { 104, 7014 },
                    { 104, 7015 },
                    { 104, 7016 },
                    { 104, 7017 },
                    { 104, 7018 },
                    { 104, 7019 },
                    { 104, 7020 },
                    { 104, 7021 },
                    { 104, 7022 },
                    { 104, 7023 },
                    { 104, 7024 },
                    { 104, 7025 },
                    { 105, 1009 },
                    { 105, 1010 },
                    { 105, 1011 },
                    { 105, 1012 },
                    { 105, 1013 },
                    { 105, 1014 },
                    { 105, 1015 },
                    { 105, 1016 },
                    { 105, 1017 },
                    { 105, 1018 },
                    { 105, 1019 },
                    { 105, 1020 },
                    { 105, 1021 },
                    { 105, 1022 },
                    { 105, 1023 },
                    { 105, 1024 },
                    { 105, 1025 },
                    { 105, 1026 },
                    { 105, 1027 },
                    { 105, 1028 },
                    { 105, 1029 },
                    { 106, 2080 },
                    { 106, 2081 },
                    { 106, 2082 },
                    { 106, 2083 },
                    { 106, 2084 },
                    { 106, 2085 },
                    { 106, 2086 },
                    { 106, 2087 },
                    { 106, 2088 },
                    { 106, 2089 },
                    { 106, 2090 },
                    { 106, 2091 },
                    { 106, 2092 },
                    { 106, 2093 },
                    { 106, 2094 },
                    { 106, 2095 },
                    { 106, 2096 },
                    { 106, 2097 },
                    { 106, 2098 },
                    { 106, 2099 },
                    { 106, 2100 },
                    { 106, 2101 },
                    { 106, 2102 },
                    { 106, 2103 },
                    { 106, 2104 },
                    { 106, 2105 },
                    { 106, 2106 },
                    { 106, 2107 },
                    { 106, 2108 },
                    { 106, 2109 },
                    { 106, 2110 },
                    { 106, 2111 },
                    { 106, 2112 },
                    { 106, 2113 },
                    { 106, 2114 },
                    { 106, 2115 },
                    { 106, 2116 },
                    { 106, 2117 },
                    { 106, 2118 },
                    { 106, 2119 },
                    { 106, 2120 },
                    { 106, 2121 },
                    { 106, 2122 },
                    { 107, 8018 },
                    { 107, 8019 },
                    { 107, 8020 },
                    { 107, 8021 },
                    { 107, 8022 },
                    { 107, 8023 },
                    { 107, 8024 },
                    { 107, 8025 },
                    { 107, 8026 },
                    { 107, 8027 },
                    { 107, 8044 },
                    { 107, 8045 },
                    { 107, 8046 },
                    { 107, 8047 },
                    { 107, 8048 },
                    { 107, 8049 },
                    { 107, 8050 },
                    { 107, 8051 },
                    { 107, 8052 },
                    { 107, 8053 },
                    { 107, 8054 },
                    { 107, 8055 },
                    { 107, 8056 },
                    { 107, 8057 },
                    { 107, 8058 },
                    { 107, 8059 },
                    { 108, 9001 },
                    { 108, 9002 },
                    { 108, 9003 },
                    { 108, 9004 },
                    { 108, 9005 },
                    { 108, 9006 },
                    { 108, 9007 },
                    { 108, 9008 },
                    { 108, 9009 },
                    { 108, 9010 },
                    { 108, 9011 },
                    { 108, 9012 },
                    { 108, 9013 },
                    { 108, 9014 },
                    { 108, 9015 },
                    { 108, 9016 },
                    { 108, 9017 },
                    { 108, 9018 },
                    { 108, 9019 },
                    { 108, 9020 },
                    { 108, 9021 },
                    { 108, 9022 },
                    { 108, 9023 },
                    { 108, 9024 },
                    { 108, 9025 },
                    { 108, 9026 },
                    { 108, 9027 },
                    { 108, 9028 },
                    { 108, 9029 },
                    { 108, 9030 },
                    { 108, 9031 },
                    { 108, 9032 },
                    { 108, 9033 },
                    { 108, 9034 },
                    { 108, 9035 },
                    { 108, 9036 },
                    { 108, 9037 },
                    { 108, 9038 },
                    { 108, 9039 },
                    { 108, 9040 },
                    { 108, 9041 },
                    { 108, 9042 },
                    { 108, 9043 },
                    { 108, 9044 },
                    { 108, 9045 },
                    { 108, 9046 },
                    { 108, 9047 },
                    { 108, 9048 },
                    { 108, 9049 },
                    { 108, 9050 },
                    { 108, 9051 },
                    { 108, 9052 },
                    { 108, 9053 },
                    { 108, 9054 },
                    { 108, 9055 },
                    { 108, 9056 },
                    { 108, 9057 },
                    { 108, 9058 },
                    { 108, 9059 },
                    { 108, 9060 },
                    { 108, 9061 },
                    { 108, 9062 },
                    { 108, 9063 },
                    { 108, 9064 },
                    { 108, 9065 },
                    { 108, 9066 },
                    { 108, 9067 },
                    { 108, 9068 },
                    { 108, 9069 },
                    { 108, 9070 },
                    { 108, 9071 },
                    { 108, 9072 },
                    { 108, 9073 },
                    { 108, 9074 },
                    { 108, 9075 },
                    { 108, 9076 },
                    { 108, 9077 },
                    { 108, 9078 },
                    { 108, 9079 },
                    { 108, 9080 },
                    { 108, 9081 },
                    { 108, 9082 },
                    { 108, 9083 },
                    { 108, 9084 },
                    { 108, 9085 },
                    { 108, 9086 },
                    { 108, 9087 },
                    { 108, 9088 },
                    { 108, 9089 },
                    { 108, 9090 },
                    { 108, 9091 },
                    { 108, 9092 },
                    { 108, 9093 },
                    { 108, 9094 },
                    { 108, 9095 },
                    { 108, 9096 },
                    { 108, 9097 },
                    { 108, 9098 },
                    { 108, 10001 },
                    { 108, 10002 },
                    { 108, 10003 },
                    { 108, 10004 },
                    { 108, 10005 },
                    { 108, 10006 },
                    { 108, 10007 },
                    { 108, 10008 },
                    { 108, 10009 },
                    { 108, 10010 },
                    { 108, 10011 },
                    { 108, 10012 },
                    { 108, 10013 },
                    { 108, 10014 },
                    { 108, 10015 },
                    { 108, 10016 },
                    { 108, 10017 },
                    { 109, 3001 },
                    { 109, 3002 },
                    { 109, 3003 },
                    { 109, 3004 },
                    { 109, 3005 },
                    { 109, 3006 },
                    { 109, 3007 },
                    { 109, 3008 },
                    { 109, 3009 },
                    { 109, 3010 },
                    { 109, 3011 },
                    { 109, 3012 },
                    { 109, 3013 },
                    { 109, 3014 },
                    { 109, 3015 },
                    { 109, 3016 },
                    { 110, 4001 },
                    { 110, 4002 },
                    { 110, 4003 },
                    { 110, 4004 },
                    { 110, 4005 },
                    { 110, 4006 },
                    { 110, 4007 },
                    { 110, 4008 },
                    { 110, 4009 },
                    { 110, 4010 },
                    { 110, 4011 },
                    { 110, 4012 },
                    { 110, 4013 },
                    { 110, 4014 },
                    { 110, 4015 },
                    { 111, 12001 },
                    { 111, 12002 },
                    { 111, 12003 },
                    { 111, 12004 },
                    { 112, 13001 },
                    { 112, 13002 },
                    { 112, 13003 },
                    { 112, 13004 },
                    { 112, 13005 },
                    { 112, 13006 },
                    { 113, 11001 },
                    { 113, 11002 },
                    { 113, 11003 },
                    { 113, 11004 },
                    { 113, 11005 },
                    { 201, 9001 },
                    { 201, 9002 },
                    { 201, 9003 },
                    { 201, 9004 },
                    { 201, 9005 },
                    { 201, 9006 },
                    { 201, 9007 },
                    { 201, 9008 },
                    { 201, 9009 },
                    { 201, 9010 },
                    { 201, 9011 },
                    { 201, 9012 },
                    { 201, 9013 },
                    { 201, 9014 },
                    { 201, 9015 },
                    { 201, 9016 },
                    { 201, 9017 },
                    { 201, 9018 },
                    { 201, 9019 },
                    { 201, 9020 },
                    { 201, 9021 },
                    { 201, 9022 },
                    { 201, 9023 },
                    { 201, 9024 },
                    { 201, 9025 },
                    { 201, 9026 },
                    { 201, 9027 },
                    { 201, 9028 },
                    { 201, 9029 },
                    { 201, 9030 },
                    { 201, 9031 },
                    { 201, 9032 },
                    { 201, 9033 },
                    { 201, 9034 },
                    { 201, 9035 },
                    { 201, 9036 },
                    { 201, 9037 },
                    { 201, 9038 },
                    { 201, 9039 },
                    { 201, 9040 },
                    { 201, 9041 },
                    { 201, 9042 },
                    { 201, 9043 },
                    { 201, 9044 },
                    { 201, 9045 },
                    { 201, 9046 },
                    { 201, 9047 },
                    { 201, 9048 },
                    { 201, 9049 },
                    { 201, 9050 },
                    { 201, 9051 },
                    { 201, 9052 },
                    { 201, 9053 },
                    { 201, 9054 },
                    { 201, 9055 },
                    { 201, 9056 },
                    { 201, 9057 },
                    { 201, 9058 },
                    { 201, 9059 },
                    { 201, 9060 },
                    { 201, 9061 },
                    { 201, 9062 },
                    { 201, 9063 },
                    { 201, 9064 },
                    { 201, 9065 },
                    { 201, 9066 },
                    { 201, 9067 },
                    { 201, 9068 },
                    { 201, 9069 },
                    { 201, 9070 },
                    { 201, 9071 },
                    { 201, 9072 },
                    { 201, 9073 },
                    { 201, 9074 },
                    { 201, 9075 },
                    { 201, 9076 },
                    { 201, 9077 },
                    { 201, 9078 },
                    { 201, 9079 },
                    { 201, 9080 },
                    { 201, 9081 },
                    { 201, 9082 },
                    { 201, 9083 },
                    { 201, 9084 },
                    { 201, 9085 },
                    { 201, 9086 },
                    { 201, 9087 },
                    { 201, 9088 },
                    { 201, 9089 },
                    { 201, 9090 },
                    { 201, 9091 },
                    { 201, 9092 },
                    { 201, 9093 },
                    { 201, 9094 },
                    { 201, 9095 },
                    { 201, 9096 },
                    { 201, 9097 },
                    { 201, 9098 },
                    { 202, 14001 },
                    { 202, 14002 },
                    { 202, 14003 },
                    { 202, 14004 },
                    { 202, 14005 },
                    { 202, 14006 },
                    { 202, 14007 },
                    { 203, 3017 },
                    { 203, 3018 },
                    { 203, 3019 },
                    { 203, 3020 },
                    { 203, 3021 },
                    { 204, 15001 },
                    { 204, 15002 },
                    { 204, 15003 },
                    { 204, 15004 },
                    { 204, 15005 },
                    { 204, 15006 },
                    { 204, 15007 },
                    { 204, 15008 },
                    { 204, 15009 },
                    { 204, 15010 },
                    { 205, 16001 },
                    { 205, 16002 },
                    { 205, 16003 },
                    { 205, 16004 },
                    { 205, 16005 },
                    { 205, 16006 },
                    { 205, 16007 },
                    { 205, 16008 },
                    { 205, 16009 },
                    { 205, 16010 },
                    { 205, 16011 },
                    { 206, 63 },
                    { 206, 64 },
                    { 206, 65 },
                    { 206, 66 },
                    { 206, 67 },
                    { 206, 68 },
                    { 206, 69 },
                    { 206, 70 },
                    { 206, 71 },
                    { 206, 72 },
                    { 206, 73 },
                    { 206, 74 },
                    { 301, 9001 },
                    { 301, 9002 },
                    { 301, 9003 },
                    { 301, 9004 },
                    { 301, 9005 },
                    { 301, 9006 },
                    { 301, 9007 },
                    { 301, 9008 },
                    { 301, 9009 },
                    { 301, 9010 },
                    { 301, 9011 },
                    { 301, 9012 },
                    { 301, 9013 },
                    { 301, 9014 },
                    { 301, 9015 },
                    { 301, 9016 },
                    { 301, 9017 },
                    { 301, 9018 },
                    { 301, 9019 },
                    { 301, 9020 },
                    { 301, 9021 },
                    { 301, 9022 },
                    { 301, 9023 },
                    { 301, 9024 },
                    { 301, 9025 },
                    { 301, 9026 },
                    { 301, 9027 },
                    { 301, 9028 },
                    { 301, 9029 },
                    { 301, 9030 },
                    { 301, 9031 },
                    { 301, 9032 },
                    { 301, 9033 },
                    { 301, 9034 },
                    { 301, 9035 },
                    { 301, 9036 },
                    { 301, 9037 },
                    { 301, 9038 },
                    { 301, 9039 },
                    { 301, 9040 },
                    { 301, 9041 },
                    { 301, 9042 },
                    { 301, 9043 },
                    { 301, 9044 },
                    { 301, 9045 },
                    { 301, 9046 },
                    { 301, 9047 },
                    { 301, 9048 },
                    { 301, 9049 },
                    { 301, 9050 },
                    { 301, 9051 },
                    { 301, 9052 },
                    { 301, 9053 },
                    { 301, 9054 },
                    { 301, 9055 },
                    { 301, 9056 },
                    { 301, 9057 },
                    { 301, 9058 },
                    { 301, 9059 },
                    { 301, 9060 },
                    { 301, 9061 },
                    { 301, 9062 },
                    { 301, 9063 },
                    { 301, 9064 },
                    { 301, 9065 },
                    { 301, 9066 },
                    { 301, 9067 },
                    { 301, 9068 },
                    { 301, 9069 },
                    { 301, 9070 },
                    { 301, 9071 },
                    { 301, 9072 },
                    { 301, 9073 },
                    { 301, 9074 },
                    { 301, 9075 },
                    { 301, 9076 },
                    { 301, 9077 },
                    { 301, 9078 },
                    { 301, 9079 },
                    { 301, 9080 },
                    { 301, 9081 },
                    { 301, 9082 },
                    { 301, 9083 },
                    { 301, 9084 },
                    { 301, 9085 },
                    { 301, 9086 },
                    { 301, 9087 },
                    { 301, 9088 },
                    { 301, 9089 },
                    { 301, 9090 },
                    { 301, 9091 },
                    { 301, 9092 },
                    { 301, 9093 },
                    { 301, 9094 },
                    { 301, 9095 },
                    { 301, 9096 },
                    { 301, 9097 },
                    { 301, 9098 },
                    { 302, 1 },
                    { 302, 2 },
                    { 302, 3 },
                    { 302, 4 },
                    { 302, 5 },
                    { 302, 6 },
                    { 302, 7 },
                    { 302, 8 },
                    { 302, 9 },
                    { 302, 10 },
                    { 302, 11 },
                    { 302, 12 },
                    { 302, 13 },
                    { 302, 14 },
                    { 302, 15 },
                    { 302, 16 },
                    { 302, 17 },
                    { 302, 18 },
                    { 302, 19 },
                    { 302, 20 },
                    { 302, 21 },
                    { 302, 22 },
                    { 302, 23 },
                    { 302, 24 },
                    { 302, 25 },
                    { 302, 26 },
                    { 302, 27 },
                    { 302, 28 },
                    { 302, 29 },
                    { 302, 30 },
                    { 302, 31 },
                    { 302, 32 },
                    { 302, 33 },
                    { 302, 34 },
                    { 302, 35 },
                    { 302, 36 },
                    { 302, 37 },
                    { 302, 38 },
                    { 302, 39 },
                    { 302, 40 },
                    { 302, 41 },
                    { 302, 42 },
                    { 302, 43 },
                    { 302, 44 },
                    { 302, 45 },
                    { 302, 46 },
                    { 302, 47 },
                    { 302, 48 },
                    { 303, 6001 },
                    { 303, 6002 },
                    { 303, 6003 },
                    { 303, 6004 },
                    { 303, 6005 },
                    { 303, 6006 },
                    { 303, 6007 },
                    { 303, 6008 },
                    { 303, 6009 },
                    { 303, 6010 },
                    { 303, 6011 },
                    { 303, 6012 },
                    { 303, 6013 },
                    { 303, 6014 },
                    { 303, 6015 },
                    { 303, 6016 },
                    { 303, 6017 },
                    { 303, 6018 },
                    { 303, 6019 },
                    { 303, 6020 },
                    { 303, 6021 },
                    { 303, 6022 },
                    { 303, 6023 },
                    { 303, 6024 },
                    { 303, 6025 },
                    { 303, 6026 },
                    { 303, 6027 },
                    { 303, 6028 },
                    { 303, 6029 },
                    { 303, 6030 },
                    { 303, 6031 },
                    { 303, 6032 },
                    { 303, 6033 },
                    { 303, 6034 },
                    { 303, 6035 },
                    { 303, 6036 },
                    { 303, 6037 },
                    { 303, 6038 },
                    { 303, 6039 },
                    { 303, 6040 },
                    { 303, 6041 },
                    { 303, 6042 },
                    { 303, 6043 },
                    { 303, 6044 },
                    { 303, 6045 },
                    { 303, 6046 },
                    { 303, 6047 },
                    { 304, 8001 },
                    { 304, 8002 },
                    { 304, 8003 },
                    { 304, 8004 },
                    { 304, 8005 },
                    { 304, 8006 },
                    { 304, 8007 },
                    { 304, 8008 },
                    { 304, 8009 },
                    { 304, 8010 },
                    { 304, 8011 },
                    { 304, 8012 },
                    { 304, 8013 },
                    { 304, 8014 },
                    { 304, 8015 },
                    { 304, 8016 },
                    { 304, 8017 },
                    { 305, 2001 },
                    { 305, 2002 },
                    { 305, 2003 },
                    { 305, 2004 },
                    { 305, 2005 },
                    { 305, 2006 },
                    { 305, 2007 },
                    { 305, 2008 },
                    { 305, 2009 },
                    { 305, 2010 },
                    { 305, 2011 },
                    { 305, 2012 },
                    { 305, 2013 },
                    { 305, 2014 },
                    { 305, 2015 },
                    { 305, 2016 },
                    { 305, 2017 },
                    { 305, 2018 },
                    { 305, 2019 },
                    { 305, 2020 },
                    { 305, 2021 },
                    { 305, 2022 },
                    { 305, 2023 },
                    { 305, 2024 },
                    { 305, 2025 },
                    { 305, 2026 },
                    { 305, 2027 },
                    { 305, 2028 },
                    { 305, 2029 },
                    { 305, 2030 },
                    { 305, 2031 },
                    { 305, 2032 },
                    { 305, 2033 },
                    { 305, 2034 },
                    { 305, 2035 },
                    { 305, 2036 },
                    { 305, 2037 },
                    { 305, 2038 },
                    { 305, 2039 },
                    { 305, 2040 },
                    { 305, 2041 },
                    { 305, 2042 },
                    { 305, 2043 },
                    { 305, 2044 },
                    { 305, 2045 },
                    { 305, 2046 },
                    { 305, 2047 },
                    { 305, 2048 },
                    { 305, 2049 },
                    { 305, 2050 },
                    { 305, 2051 },
                    { 305, 2052 },
                    { 305, 2053 },
                    { 305, 2054 },
                    { 305, 2055 },
                    { 305, 2056 },
                    { 305, 2057 },
                    { 305, 2058 },
                    { 305, 2059 },
                    { 305, 2060 },
                    { 306, 17001 },
                    { 306, 17002 },
                    { 306, 17003 },
                    { 306, 17004 },
                    { 306, 17005 },
                    { 306, 17006 },
                    { 306, 17007 },
                    { 306, 17008 },
                    { 306, 17009 },
                    { 306, 17010 },
                    { 306, 17011 },
                    { 306, 17012 },
                    { 306, 17013 },
                    { 306, 17014 },
                    { 306, 17015 },
                    { 306, 17016 },
                    { 306, 17017 },
                    { 306, 17018 },
                    { 306, 17019 },
                    { 306, 17020 },
                    { 306, 17021 },
                    { 306, 17022 },
                    { 306, 17023 },
                    { 306, 17024 },
                    { 306, 17025 },
                    { 306, 17026 },
                    { 306, 17027 },
                    { 306, 17028 },
                    { 306, 17029 },
                    { 306, 17030 },
                    { 306, 17031 },
                    { 306, 17032 },
                    { 306, 17033 },
                    { 306, 17034 },
                    { 306, 17035 },
                    { 306, 17036 },
                    { 306, 17037 },
                    { 306, 17038 },
                    { 306, 17039 },
                    { 306, 17040 },
                    { 306, 17041 },
                    { 306, 17042 },
                    { 306, 17043 },
                    { 306, 17044 },
                    { 306, 17045 },
                    { 306, 17046 },
                    { 306, 17047 },
                    { 306, 17048 },
                    { 306, 17049 },
                    { 306, 17050 },
                    { 306, 17051 },
                    { 306, 17052 },
                    { 306, 17053 },
                    { 306, 17054 },
                    { 306, 17055 },
                    { 306, 17056 },
                    { 306, 17057 },
                    { 306, 17058 },
                    { 306, 17059 },
                    { 306, 17060 },
                    { 306, 17061 },
                    { 306, 17062 },
                    { 307, 18001 },
                    { 307, 18002 },
                    { 307, 18003 },
                    { 307, 18004 },
                    { 307, 18005 }
                });

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
                name: "IX_Comments_AppUserId",
                table: "Comments",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_ParentId",
                table: "Comments",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_QuestionId",
                table: "Comments",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_RepliedId",
                table: "Comments",
                column: "RepliedId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_SolutionId",
                table: "Comments",
                column: "SolutionId");

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserLikes_AppUserId",
                table: "CommentUserLikes",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserLikes_CommentId",
                table: "CommentUserLikes",
                column: "CommentId");

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserTag_AppUserId",
                table: "CommentUserTag",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_CommentUserTag_CommentId",
                table: "CommentUserTag",
                column: "CommentId");

            migrationBuilder.CreateIndex(
                name: "IX_Follows_FollowedId",
                table: "Follows",
                column: "FollowedId");

            migrationBuilder.CreateIndex(
                name: "IX_Follows_FollowerId",
                table: "Follows",
                column: "FollowerId");

            migrationBuilder.CreateIndex(
                name: "IX_MessageImage_MessageId",
                table: "MessageImage",
                column: "MessageId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_ReceiverId",
                table: "Messages",
                column: "ReceiverId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_SenderId",
                table: "Messages",
                column: "SenderId");

            migrationBuilder.CreateIndex(
                name: "IX_MessageUserReceive_MessageId",
                table: "MessageUserReceive",
                column: "MessageId");

            migrationBuilder.CreateIndex(
                name: "IX_MessageUserView_MessageId",
                table: "MessageUserView",
                column: "MessageId");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_AppUserId",
                table: "Notifications",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_CommentId",
                table: "Notifications",
                column: "CommentId");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_OwnerId",
                table: "Notifications",
                column: "OwnerId");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_QuestionId",
                table: "Notifications",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_Notifications_SolutionId",
                table: "Notifications",
                column: "SolutionId");

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
                name: "IX_QuestionTopic_QuestionId",
                table: "QuestionTopic",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionTopic_TopicId",
                table: "QuestionTopic",
                column: "TopicId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserLikes_AppUserId",
                table: "QuestionUserLikes",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserLikes_QuestionId",
                table: "QuestionUserLikes",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserSaves_AppUserId",
                table: "QuestionUserSaves",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_QuestionUserSaves_QuestionId",
                table: "QuestionUserSaves",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionImage_SolutionId",
                table: "SolutionImage",
                column: "SolutionId");

            migrationBuilder.CreateIndex(
                name: "IX_Solutions_AppUserId",
                table: "Solutions",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Solutions_QuestionId",
                table: "Solutions",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserSaves_AppUserId",
                table: "SolutionUserSaves",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserSaves_SolutionId",
                table: "SolutionUserSaves",
                column: "SolutionId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserVotes_AppUserId",
                table: "SolutionUserVotes",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_SolutionUserVotes_SolutionId",
                table: "SolutionUserVotes",
                column: "SolutionId");

            migrationBuilder.CreateIndex(
                name: "IX_Subjects_ExamId",
                table: "Subjects",
                column: "ExamId");

            migrationBuilder.CreateIndex(
                name: "IX_SubjectTopic_TopicId",
                table: "SubjectTopic",
                column: "TopicId");

            migrationBuilder.CreateIndex(
                name: "IX_UserSearchs_SearchedId",
                table: "UserSearchs",
                column: "SearchedId");

            migrationBuilder.CreateIndex(
                name: "IX_UserSearchs_SearcherId",
                table: "UserSearchs",
                column: "SearcherId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationToken_AccountId",
                table: "VerificationToken",
                column: "AccountId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AccountPrivacyPolicy");

            migrationBuilder.DropTable(
                name: "AccountTermsOfUse");

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
                name: "CommentLikeNotification");

            migrationBuilder.DropTable(
                name: "CommentUserLikes");

            migrationBuilder.DropTable(
                name: "CommentUserTag");

            migrationBuilder.DropTable(
                name: "Follows");

            migrationBuilder.DropTable(
                name: "MessageImage");

            migrationBuilder.DropTable(
                name: "MessageResponseDtos");

            migrationBuilder.DropTable(
                name: "MessageUserReceive");

            migrationBuilder.DropTable(
                name: "MessageUserRemove");

            migrationBuilder.DropTable(
                name: "MessageUserView");

            migrationBuilder.DropTable(
                name: "NotificationConnections");

            migrationBuilder.DropTable(
                name: "Notifications");

            migrationBuilder.DropTable(
                name: "PrivacyPolicies");

            migrationBuilder.DropTable(
                name: "QuestionImage");

            migrationBuilder.DropTable(
                name: "QuestionLikeNotification");

            migrationBuilder.DropTable(
                name: "QuestionTopic");

            migrationBuilder.DropTable(
                name: "QuestionUserLikes");

            migrationBuilder.DropTable(
                name: "QuestionUserSaves");

            migrationBuilder.DropTable(
                name: "SolutionImage");

            migrationBuilder.DropTable(
                name: "SolutionUserSaves");

            migrationBuilder.DropTable(
                name: "SolutionUserVotes");

            migrationBuilder.DropTable(
                name: "SolutionVoteNotification");

            migrationBuilder.DropTable(
                name: "SubjectTopic");

            migrationBuilder.DropTable(
                name: "TermsOfUses");

            migrationBuilder.DropTable(
                name: "UserConnections");

            migrationBuilder.DropTable(
                name: "UserFollowNotification");

            migrationBuilder.DropTable(
                name: "UserSearchs");

            migrationBuilder.DropTable(
                name: "VerificationToken");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Messages");

            migrationBuilder.DropTable(
                name: "Comments");

            migrationBuilder.DropTable(
                name: "Topics");

            migrationBuilder.DropTable(
                name: "Solutions");

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
