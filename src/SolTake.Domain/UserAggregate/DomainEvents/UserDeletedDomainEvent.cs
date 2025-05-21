using SolTake.Domain.UserAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.UserAggregate.DomainEvents
{
    public record UserDeletedDomainEvent(User User) : IDomainEvent;
}
