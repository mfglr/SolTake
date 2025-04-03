using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents
{
    public record UserFollowedDomainEvent(User User, Follow Follow, Login Login) : IDomainEvent;
}
