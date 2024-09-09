using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MySocailApp.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class CreateStoredProcedureGetConversations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql($@"
                CREATE PROCEDURE sp_get_conversations

					@accountId INT,
					@offset INT,
					@take INT

				AS BEGIN

					SELECT TOP(@take) 
						[all].[Id],[accounts].UserName, [all].[ConversationId], [all].[Content], [all].[CreatedAt], [all].[IsEdited], 
						[all].[UpdatedAt], [all].[SenderId], [all].[ReceiverId], [all].[State],[all].[NumberOfImages], [all].[IsOwner]
					FROM
					(
						SELECT
							[pM].[Id], [pM].[ConversationId], [pM].[Content], [pM].[CreatedAt], [pM].[IsEdited], [pM].[UpdatedAt], [pM].[SenderId], [pM].[ReceiverId], [pM].[row],
							CASE WHEN [pM].SenderId = @accountId THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS [IsOwner],
							CASE WHEN EXISTS (SELECT 1 FROM [MessageUserView] WHERE [messageId] = [pM].[Id])
								THEN 2
								ELSE  CASE WHEN EXISTS (SELECT 1 FROM [MessageUserReceive] WHERE [messageId] = [pM].[Id]) THEN 1 ELSE 0  END
							END AS [State],
							(SELECT COUNT(*) FROM [MessageImage] WHERE [messageId] = [pM].[Id]) AS NumberOfImages
						FROM (
							SELECT *, ROW_NUMBER() OVER(PARTITION BY [fM].[ConversationId] ORDER BY [fM].[Id] DESC) AS [row]
							FROM (
								SELECT *, CASE  WHEN [messages].[SenderId] = @accountId THEN [messages].[ReceiverId] ELSE [messages].[SenderId]  END AS [ConversationId]
									FROM [Messages] AS [messages]
									WHERE [messages].[SenderId] = @accountId OR [messages].[ReceiverId] = @accountId
							) AS [fM]
						) AS [pM]
					) AS [all]
					JOIN AspNetUsers AS [accounts] ON [accounts].[Id] = [all].[ConversationId]
					WHERE ([all].[SenderId] = @accountId OR [all].[State] = 2) AND [all].[row] <= 1 AND (@offset IS NULL OR [all].Id < @offset)
					ORDER BY [all].Id DESC
				END
            ");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql($@"drop proc sp_get_conversations");
        }
    }
}
