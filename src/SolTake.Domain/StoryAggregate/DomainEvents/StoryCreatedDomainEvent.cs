using MySocailApp.Domain.StoryAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.StoryAggregate.DomainEvents
{
    public record StoryCreatedDomainEvent(Story Story) : IDomainEvent;
}
