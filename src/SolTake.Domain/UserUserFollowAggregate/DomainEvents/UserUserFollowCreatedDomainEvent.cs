using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowCreatedDomainEvent(User User, UserUserFollow Follow, Login Login) : IDomainEvent;
}
