using MySocailApp.Core;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record ProfileImageUpdatedDomainEvent(int UserId) : IDomainEvent;
}
