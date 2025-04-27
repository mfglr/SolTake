using MySocailApp.Core;
using MySocailApp.Domain.StoryUserViewAggregate.Entities;

namespace MySocailApp.Domain.StoryUserViewAggregate.DomainEvents
{
    public record StoryUserViewCreatedDomainEvent(StoryUserView StoryUserView) : IDomainEvent;
}
