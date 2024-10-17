using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record UserDeletedDomainEvent(AppUser User): IDomainEvent;
}
