using MySocailApp.Core;
using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserUserBlockAggregate.DomainEvents
{
    public record UserUserBlockCreatedDomainEvent(UserUserBlock UserUserBlock) : IDomainEvent;
}
