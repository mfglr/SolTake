using MySocailApp.Core;
using MySocailApp.Domain.FollowAggregate.Entities;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.FollowAggregate.DomainEvents
{
    public record UserFollowedDomainEvent(User User, Follow Follow, Login Login) : IDomainEvent;
}
