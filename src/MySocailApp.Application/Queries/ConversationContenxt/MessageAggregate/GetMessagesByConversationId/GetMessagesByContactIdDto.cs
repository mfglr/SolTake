using MediatR;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;

namespace MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate.GetMessagesByConversationId
{
    public record GetMessagesByContactIdDto(int UserId, int? LasId, int? Take) : IRequest<List<MessageResponseDto>>;
}
