using SolTake.Core;

namespace SolTake.Application.Queries.UserUserConversation
{
    public record UserUserConversationResponseDto(int Id, int UserId, string UserName, string? Name, Multimedia? Image);
}
