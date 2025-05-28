using SolTake.Core;
using SolTake.Domain.PurchaseAggregate.Entities;

namespace SolTake.Domain.PurchaseAggregate.DomainEvents
{
    public record PurchageCreatedDomainEvent(Purchase Purchase) : IDomainEvent;
}
