using SolTake.Core;
using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.TopicRequestAggregate.DomainEvents
{
    public record TopicRequestApprovedDomainEvent(TopicRequest TopicRequest) : IDomainEvent;
}
