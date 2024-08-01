using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.DomainEvents
{
    public record AddedReceiverToMessagesDomainEvent(int OwnerId, int ReceiverId, IEnumerable<Message> Messages) : IDomainEvent;
}
