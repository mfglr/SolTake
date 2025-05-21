using SolTake.Core;
using SolTake.Domain.MessageUserRemoveAggregate.Entities;

namespace SolTake.Domain.MessageUserRemoveAggregate.DomainEvents
{
    public record MessageUserRemoveCreatedDomainEvent(MessageUserRemove MessageUserRemove) : IDomainEvent;
}
