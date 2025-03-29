using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserViewAggregate.MarkMessagesAsViewed
{
    public record MarkMessagesAsViewedDto(List<int> MessageIds) : IRequest;
}
