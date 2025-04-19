using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;

namespace MySocailApp.Domain.UserUserFollowAggregate.DomainEvents
{
    public record UserUserFollowCreatedDomainEvent(User User, UserUserFollow Follow, Login Login) : IDomainEvent;
}
