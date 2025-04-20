using MySocailApp.Core;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowDeletedDomainEvent(UserUserFollow UserUserFollow) : IDomainEvent;
}
