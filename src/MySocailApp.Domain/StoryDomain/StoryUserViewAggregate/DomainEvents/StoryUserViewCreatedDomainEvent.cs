using MySocailApp.Core;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Entities;

namespace MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.DomainEvents
{
    public record StoryUserViewCreatedDomainEvent(StoryUserView StoryUserView, Login Login) : IDomainEvent;
}
