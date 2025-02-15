using MySocailApp.Core;

namespace MySocailApp.Domain.UserDomain.UserAggregate.DomainEvents
{
    public record ProfileImageDeletedDomainEvent(Multimedia Image) : IDomainEvent;
}
