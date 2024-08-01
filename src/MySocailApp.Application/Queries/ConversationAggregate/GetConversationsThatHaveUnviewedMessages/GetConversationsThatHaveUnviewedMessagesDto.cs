using MediatR;
using MySocailApp.Application.Queries.ConversationAggregate;

namespace MySocailApp.Application.Queries.ConversationAggregate.GetConversationsThatHaveUnviewedMessages
{
    public record GetConversationsThatHaveUnviewedMessagesDto : IRequest<List<ConversationResponseDto>>;
}
