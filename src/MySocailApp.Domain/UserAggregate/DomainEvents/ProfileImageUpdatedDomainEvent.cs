using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record ProfileImageUpdatedDomainEvent(User User) : IDomainEvent;
}
