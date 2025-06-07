using SolTake.Core;
using SolTake.Domain.PurchaseAggregate.DomainEvents;

namespace SolTake.Domain.PurchaseAggregate.Entities
{
    public class Purchase(int userId, string token, string productId) : Entity, IAggregateRoot
    {
        public int UserId { get; private set; } = userId;
        public string Token { get; private set; } = token;
        public string ProductId { get; private set; } = productId;

        internal void Create()
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new PurchageCreatedDomainEvent(this));
        }
    }
}
