using MySocailApp.Core;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record UserUnfollowedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
