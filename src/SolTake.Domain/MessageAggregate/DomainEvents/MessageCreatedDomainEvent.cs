using SolTake.Core;
using SolTake.Domain.MessageAggregate.Entities;

namespace SolTake.Domain.MessageAggregate.DomainEvents
{
    public record MessageCreatedDomainEvent(Message Message, Login Login) : IDomainEvent;
}
