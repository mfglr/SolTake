using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.AddReceiverToMessage
{
    public record AddReceiverToMessageDto(int MessageId) : IRequest;
}
