using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.DomainEvents
{
    public record MessageUserRemoveCreatedDomainEvent(MessageUserRemove MessageUserRemove) : IDomainEvent;
}
