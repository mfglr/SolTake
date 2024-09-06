using MySocailApp.Core;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record UserUnfollowedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
