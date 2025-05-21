using SolTake.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowDeletedDomainEvent(UserUserFollow UserUserFollow) : IDomainEvent;
}
