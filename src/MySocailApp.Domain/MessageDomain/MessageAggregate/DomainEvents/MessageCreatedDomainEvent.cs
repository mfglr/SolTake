using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents
{
    public record MessageCreatedDomainEvent(Message Message) : IDomainEvent;
}
