using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record UserDeletedDomainEvent(User User) : IDomainEvent;
}
