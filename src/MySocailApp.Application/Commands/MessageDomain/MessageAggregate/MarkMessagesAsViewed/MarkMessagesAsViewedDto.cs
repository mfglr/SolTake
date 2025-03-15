using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.MarkMessagesAsViewed
{
    public record MarkMessagesAsViewedDto(List<int> Ids) : IRequest;
}
