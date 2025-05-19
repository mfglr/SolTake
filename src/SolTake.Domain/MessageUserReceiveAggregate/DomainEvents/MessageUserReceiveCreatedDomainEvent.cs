using MySocailApp.Domain.MessageUserReceiveAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.MessageUserReceiveAggregate.DomainEvents
{
    public record MessageUserReceiveCreatedDomainEvent(MessageUserReceive MessageUserReceive) : IDomainEvent;
}
