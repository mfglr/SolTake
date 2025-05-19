using MySocailApp.Domain.StoryUserViewAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.StoryUserViewAggregate.DomainEvents
{
    public record StoryUserViewCreatedDomainEvent(StoryUserView StoryUserView) : IDomainEvent;
}
