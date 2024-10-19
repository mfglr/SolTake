using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public class GetConversationsDto(int offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<MessageResponseDto>>;
}
