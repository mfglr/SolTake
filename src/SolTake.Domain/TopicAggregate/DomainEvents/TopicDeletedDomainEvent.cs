using SolTake.Core;
using SolTake.Domain.TopicAggregate.Entities;

namespace SolTake.Domain.TopicAggregate.DomainEvents
{
    public record TopicDeletedDomainEvent(Topic Topic) : IDomainEvent;
}
