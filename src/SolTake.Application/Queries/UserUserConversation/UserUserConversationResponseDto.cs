using SolTake.Core;

namespace MySocailApp.Application.Queries.UserUserConversation
{
    public record UserUserConversationResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
