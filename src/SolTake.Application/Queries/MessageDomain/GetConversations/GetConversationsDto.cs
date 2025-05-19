using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.MessageDomain.GetConversations
{
    public record GetConversationsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<IEnumerable<MessageResponseDto>>;
}
