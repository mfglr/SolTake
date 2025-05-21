using SolTake.Core;
using SolTake.Domain.MessageAggregate.Entities;

namespace SolTake.Domain.MessageAggregate.DomainEvents
{
    public record MessageDeletedDomainEvent(Message Message) : IDomainEvent;
}
