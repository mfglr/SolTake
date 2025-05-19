using MySocailApp.Domain.MessageConnectionAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.MessageConnectionAggregate.DomainEvents
{
    public record MessageConnectionStateChangedDomainEvent(MessageConnection MessageConnection, string UserName, Multimedia? Image) : IDomainEvent;
}
