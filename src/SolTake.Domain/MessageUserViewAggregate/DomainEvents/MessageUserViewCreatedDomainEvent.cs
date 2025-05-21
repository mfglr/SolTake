using SolTake.Domain.MessageUserViewAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.MessageUserViewAggregate.DomainEvents
{
    public record MessageUserViewCreatedDomainEvent(MessageUserView MessageUserView) : IDomainEvent;
}
