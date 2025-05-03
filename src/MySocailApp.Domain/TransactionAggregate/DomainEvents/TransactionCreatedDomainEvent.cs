using MySocailApp.Core;
using MySocailApp.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Domain.TransactionAggregate.DomainEvents
{
    public record TransactionCreatedDomainEvent(Transaction Transaction) : IDomainEvent;
}
