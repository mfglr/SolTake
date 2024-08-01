using MediatR;
using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Application.Queries.MessageAggregate.GetUnviewedMessagesByConversationId
{
    public record GetUnviewedMessagesByConversationIdDto(int ConversationId) : IRequest<List<MessageResponseDto>>;
}
