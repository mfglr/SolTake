using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserReceiveAggregate.DomainEvents
{
    public record MessageUserReceiveCreatedDomainEvent(MessageUserReceive MessageUserReceive) : IDomainEvent;
}
