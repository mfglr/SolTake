using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageUserRemoveAggregate.RemoveMessages
{
    public record RemoveMessagesDto(IEnumerable<int> MessageIds, bool Everyone) : IRequest;
}
