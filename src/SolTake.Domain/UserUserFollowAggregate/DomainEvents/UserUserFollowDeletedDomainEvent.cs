using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowDeletedDomainEvent(UserUserFollow UserUserFollow) : IDomainEvent;
}
