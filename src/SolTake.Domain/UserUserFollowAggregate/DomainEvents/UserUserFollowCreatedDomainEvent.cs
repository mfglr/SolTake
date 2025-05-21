using SolTake.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowCreatedDomainEvent(User User, UserUserFollow Follow, Login Login) : IDomainEvent;
}
