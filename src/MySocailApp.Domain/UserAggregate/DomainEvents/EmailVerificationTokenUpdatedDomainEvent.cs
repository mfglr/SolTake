using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record EmailVerificationTokenUpdatedDomainEvent(User User) : IDomainEvent;
}
