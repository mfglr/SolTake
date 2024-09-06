using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record UserFollowedDomainEvent(Follow Follow) : IDomainEvent;
}
