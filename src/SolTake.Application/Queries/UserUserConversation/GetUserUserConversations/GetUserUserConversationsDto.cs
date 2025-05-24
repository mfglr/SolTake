using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.UserUserConversation.GetUserUserConversations
{
    public record GetUserUserConversationsDto(int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<UserUserConversationResponseDto>>;
}
