using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageUserReceiveAggregate.MarkMessagesAsReceived
{
    public record MarkMessagesAsReceivedDto(List<int> MessageIds) : IRequest;
}
