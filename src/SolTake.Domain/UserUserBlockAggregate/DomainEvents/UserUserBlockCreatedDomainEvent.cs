using MySocailApp.Domain.UserUserBlockAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.UserUserBlockAggregate.DomainEvents
{
    public record UserUserBlockCreatedDomainEvent(UserUserBlock UserUserBlock) : IDomainEvent;
}
