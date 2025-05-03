using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;

namespace MySocailApp.Domain.TransactionAggregate.Entities
{
    public class Transaction(int balanceId, Money money) : Entity, IAggregateRoot
    {
        public int BalanceId { get; private set; } = balanceId;
        public Money Money { get; private set; } = money;

        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
