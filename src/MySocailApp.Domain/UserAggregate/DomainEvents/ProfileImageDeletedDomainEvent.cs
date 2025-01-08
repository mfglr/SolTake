using MySocailApp.Core;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record ProfileImageDeletedDomainEvent(int UserId) : IDomainEvent;
}
