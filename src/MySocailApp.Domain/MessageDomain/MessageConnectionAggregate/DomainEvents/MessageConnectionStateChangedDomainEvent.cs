using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents
{
    public record MessageConnectionStateChangedDomainEvent(MessageConnection MessageConnection) : IDomainEvent;
}
