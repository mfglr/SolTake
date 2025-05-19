using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived
{
    public record MarkMessagesAsReceivedDto(List<int> MessageIds) : IRequest;
}
