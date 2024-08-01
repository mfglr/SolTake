using MediatR;
using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessagesByConversationId
{
    public record GetMessagesByConversationIdDto(int ConversationId, int? LasId, int? Take) : IRequest<List<MessageResponseDto>>;
}
