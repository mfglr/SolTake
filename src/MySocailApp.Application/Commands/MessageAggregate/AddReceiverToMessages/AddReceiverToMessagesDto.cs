using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.AddReceiverToMessages
{
    public record AddReceiverToMessagesDto(List<int> Ids) : IRequest;
}
