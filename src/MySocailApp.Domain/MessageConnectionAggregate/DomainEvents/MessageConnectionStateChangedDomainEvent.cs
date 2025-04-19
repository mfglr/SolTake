using MySocailApp.Core;
using MySocailApp.Domain.MessageConnectionAggregate.Entities;

namespace MySocailApp.Domain.MessageConnectionAggregate.DomainEvents
{
    public record MessageConnectionStateChangedDomainEvent(MessageConnection MessageConnection, string UserName, Multimedia? Image) : IDomainEvent;
}
