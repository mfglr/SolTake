using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents
{
    public record PasswordResetTokenGeneratedDomainEvent(User User) : IDomainEvent;
}
