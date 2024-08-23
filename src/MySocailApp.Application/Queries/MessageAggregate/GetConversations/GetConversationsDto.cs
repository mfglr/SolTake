using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageAggregate.GetConversations
{
    public record GetConversationsDto(int? Offset, int Take) : IRequest<List<MessageResponseDto>>;
}
