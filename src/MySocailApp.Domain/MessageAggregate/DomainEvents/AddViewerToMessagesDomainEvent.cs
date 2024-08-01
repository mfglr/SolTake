using MySocailApp.Core;
using MySocailApp.Domain.MessageAggregate.Entities;

namespace MySocailApp.Domain.MessageAggregate.DomainEvents
{
    public record AddViewerToMessagesDomainEvent(int OwnerId, int ViewerId, IEnumerable<Message> Messages) : IDomainEvent;
}
