using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents
{
    public record MessageDeletedDomainEvent(Message Message) : IDomainEvent;
}
