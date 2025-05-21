using SolTake.Domain.StoryAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.StoryAggregate.DomainEvents
{
    public record StoryCreatedDomainEvent(Story Story) : IDomainEvent;
}
