using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.FollowAggregate.DomainEvents
{
    public record UserFollowedDomainEvent(Follow Follow) : IDomainEvent;
}
