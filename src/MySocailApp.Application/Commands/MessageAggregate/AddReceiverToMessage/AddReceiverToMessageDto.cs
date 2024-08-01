using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessage
{
    public record AddReceiverToMessageDto(int MessageId) : IRequest;
}
