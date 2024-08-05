using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.MarkMessagesAsReceived
{
    public record MarkMessagesAsReceivedDto(List<int> Ids) : IRequest;
}
