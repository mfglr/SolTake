using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.MarkMessagesAsViewed
{
    public record MarkMessagesAsViewedDto(List<int> Ids) : IRequest;
}
