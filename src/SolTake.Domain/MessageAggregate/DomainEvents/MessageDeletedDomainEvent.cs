using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents
{
    public record MessageDeletedDomainEvent(Message Message) : IDomainEvent;
}
