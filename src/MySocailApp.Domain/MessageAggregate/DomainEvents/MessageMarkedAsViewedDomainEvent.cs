using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.DomainEvents
{
    public record MessageMarkedAsViewedDomainEvent(Message Message) : IDomainEvent;
}
