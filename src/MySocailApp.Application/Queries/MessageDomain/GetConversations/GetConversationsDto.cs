using MediatR;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageDomain.GetConversations
{
    public class GetConversationsDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<IEnumerable<MessageResponseDto>>;
}
