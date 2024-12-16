using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.ValueObjects;

namespace MySocailApp.Domain.UserAggregate.DomainEvents
{
    public record ProfileImageDeletedDomainEvent(ProfileImage Image) : IDomainEvent;
}
