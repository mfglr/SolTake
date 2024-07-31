using MediatR;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessageAsViewed
{
    public record MarkMessageAsViewedDto(int MessageId) : IRequest;
}
