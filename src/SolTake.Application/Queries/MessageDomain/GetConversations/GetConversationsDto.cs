using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.MessageDomain.GetConversations
{
    public record GetConversationsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<IEnumerable<MessageResponseDto>>;
}
