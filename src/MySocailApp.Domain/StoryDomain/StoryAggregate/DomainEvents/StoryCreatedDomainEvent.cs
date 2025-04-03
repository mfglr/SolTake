using MySocailApp.Core;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;

namespace MySocailApp.Domain.StoryDomain.StoryAggregate.DomainEvents
{
    public record StoryCreatedDomainEvent(Story Story) : IDomainEvent;
}
