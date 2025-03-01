using MySocailApp.Core;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents
{
    public record UserUnfollowedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
