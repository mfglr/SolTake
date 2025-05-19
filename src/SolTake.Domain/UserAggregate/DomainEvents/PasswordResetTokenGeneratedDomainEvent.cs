using MySocailApp.Domain.UserAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record PasswordResetTokenGeneratedDomainEvent(User User) : IDomainEvent;
}
