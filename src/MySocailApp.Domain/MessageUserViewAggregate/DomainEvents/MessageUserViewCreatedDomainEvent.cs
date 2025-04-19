using MySocailApp.Core;
using MySocailApp.Domain.MessageUserViewAggregate.Entities;

namespace MySocailApp.Domain.MessageUserViewAggregate.DomainEvents
{
    public record MessageUserViewCreatedDomainEvent(MessageUserView MessageUserView) : IDomainEvent;
}
