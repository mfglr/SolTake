using MySocailApp.Core;
using MySocailApp.Domain.BalanceDomain.TransactionAggregate.ValueObjects;
using MySocailApp.Domain.BalanceDomain.WalletAggregate.ValueObjects;

namespace MySocailApp.Domain.BalanceDomain.TransactionAggregate.Entities
{
    public class Transaction(int walletId, Money money, TransactionType Type) : Entity, IAggregateRoot
    {
        public int WalletId { get; private set; } = walletId;
        public Money Money { get; private set; } = money;
        public TransactionType Type { get; private set; } = Type;

        internal void Create() => CreatedAt = DateTime.UtcNow;
    }
}
