using SolTake.Core;
using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace SolTake.Domain.MessageConnectionAggregate.DomainEvents
{
    public record MessageConnectionStateChangedDomainEvent(MessageConnection MessageConnection, string UserName, Multimedia? Image) : IDomainEvent;
}
