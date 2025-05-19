using MySocailApp.Domain.MessageUserRemoveAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.MessageUserRemoveAggregate.DomainEvents
{
    public record MessageUserRemoveCreatedDomainEvent(MessageUserRemove MessageUserRemove) : IDomainEvent;
}
