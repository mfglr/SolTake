using MySocailApp.Core;
using MySocailApp.Domain.MessageUserReceiveAggregate.Entities;

namespace MySocailApp.Domain.MessageUserReceiveAggregate.DomainEvents
{
    public record MessageUserReceiveCreatedDomainEvent(MessageUserReceive MessageUserReceive) : IDomainEvent;
}
