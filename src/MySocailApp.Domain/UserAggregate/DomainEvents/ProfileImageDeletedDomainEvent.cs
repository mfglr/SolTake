using MySocailApp.Core;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record ProfileImageDeletedDomainEvent(Multimedia Image) : IDomainEvent;
}
