using MySocailApp.Core;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents
{
    public record UserUnfollowedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
