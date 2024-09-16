using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;

namespace MySocailApp.Domain.AppUserAggregate.DomainEvents
{
    public record ProfileImageDeletedDomainEvent(ProfileImage Image) : IDomainEvent;
}
