using SolTake.Core;
using SolTake.Domain.MessageUserReceiveAggregate.Entities;

namespace SolTake.Domain.MessageUserReceiveAggregate.DomainEvents
{
    public record MessageUserReceiveCreatedDomainEvent(MessageUserReceive MessageUserReceive) : IDomainEvent;
}
