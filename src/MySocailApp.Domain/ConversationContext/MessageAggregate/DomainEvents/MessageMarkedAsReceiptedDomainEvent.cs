using MySocailApp.Core;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.DomainEvents
{
    public record MessageMarkedAsReceiptedDomainEvent(Message Message) : IDomainEvent;
}
