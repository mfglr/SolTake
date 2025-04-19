using MySocailApp.Core;
using MySocailApp.Domain.MessageUserRemoveAggregate.Entities;

namespace MySocailApp.Domain.MessageUserRemoveAggregate.DomainEvents
{
    public record MessageUserRemoveCreatedDomainEvent(MessageUserRemove MessageUserRemove) : IDomainEvent;
}
