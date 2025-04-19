using MySocailApp.Core;

namespace MySocailApp.Domain.FollowAggregate.DomainEvents
{
    public record UserUnfollowedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
