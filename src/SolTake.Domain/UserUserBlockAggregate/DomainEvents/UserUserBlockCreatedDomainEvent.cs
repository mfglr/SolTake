using SolTake.Domain.UserUserBlockAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.UserUserBlockAggregate.DomainEvents
{
    public record UserUserBlockCreatedDomainEvent(UserUserBlock UserUserBlock) : IDomainEvent;
}
