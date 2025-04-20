using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserUserConversation.GetUserUserConversations
{
    public record GetUserUserConversationsDto(int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<UserUserConversationResponseDto>>;
}
