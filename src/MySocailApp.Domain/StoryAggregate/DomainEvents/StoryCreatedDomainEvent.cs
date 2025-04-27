using MySocailApp.Core;
using MySocailApp.Domain.StoryAggregate.Entities;

namespace MySocailApp.Domain.StoryAggregate.DomainEvents
{
    public record StoryCreatedDomainEvent(Story Story) : IDomainEvent;
}
