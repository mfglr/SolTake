using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.MarkMessagesAsReceived
{
    public record MarkMessagesAsReceivedDto(List<int> Ids) : IRequest;
}
