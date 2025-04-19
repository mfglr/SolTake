using MySocailApp.Core;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowDeletedDomainEvent(int FollowerId, int FollowedId) : IDomainEvent;
}
