using MediatR;

namespace MySocailApp.Application.Commands.ConversationContext.MarkMessagesAsViewed
{
    public record MarkMessagesAsViewedDto(List<int> Ids) : IRequest;
}
