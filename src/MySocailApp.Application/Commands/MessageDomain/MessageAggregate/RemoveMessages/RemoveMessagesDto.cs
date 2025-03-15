using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.RemoveMessages
{
    public record RemoveMessagesDto(IEnumerable<int> MessageIds) : IRequest;
}
