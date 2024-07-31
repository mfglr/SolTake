using MediatR;
using MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate;

namespace MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate.GetUnviewedMessages
{
    public record GetUnviewedMessagesDto : IRequest<List<MessageResponseDto>>;
}
