using SolTake.Core;
using SolTake.Domain.TransactionAggregate.Entities;

namespace SolTake.Domain.TransactionAggregate.DomainEvents
{
    public record TransactionCreatedDomainEvent(Transaction Transaction) : IDomainEvent;
}
