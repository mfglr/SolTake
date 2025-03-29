using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.Entities;

namespace MySocailApp.Domain.MessageDomain.MessageUserViewAggregate.DomainEvents
{
    public record MessageUserViewCreatedDomainEvent(MessageUserView MessageUserView) : IDomainEvent;
}
