using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents
{
    public record UserNameUpdatedDomainEvent(User User) : IDomainEvent;
}