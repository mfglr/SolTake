using MySocailApp.Core;
using MySocailApp.Domain.UserUserBlockAggregate.Entities;

namespace MySocailApp.Domain.UserUserBlockAggregate.DomainEvents
{
    public record UserUserBlockCreatedDomainEvent(UserUserBlock UserUserBlock) : IDomainEvent;
}
