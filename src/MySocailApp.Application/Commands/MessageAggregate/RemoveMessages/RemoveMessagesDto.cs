using MediatR;

namespace MySocailApp.Application.Commands.MessageAggregate.RemoveMessages
{
    public record RemoveMessagesDto(IEnumerable<int> MessageIds) : IRequest;
}
