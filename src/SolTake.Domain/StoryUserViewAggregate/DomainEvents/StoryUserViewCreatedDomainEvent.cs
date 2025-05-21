using SolTake.Domain.StoryUserViewAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.StoryUserViewAggregate.DomainEvents
{
    public record StoryUserViewCreatedDomainEvent(StoryUserView StoryUserView) : IDomainEvent;
}
