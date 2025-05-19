using MySocailApp.Domain.MessageUserViewAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.MessageUserViewAggregate.DomainEvents
{
    public record MessageUserViewCreatedDomainEvent(MessageUserView MessageUserView) : IDomainEvent;
}
