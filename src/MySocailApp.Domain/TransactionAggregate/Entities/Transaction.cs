using MySocailApp.Core;
using MySocailApp.Domain.BalanceAggregate.ValueObjects;

namespace MySocailApp.Domain.TransactionAggregate.Entities
{
    public class Transaction : Entity, IAggregateRoot
    {
        private Transaction() { }

        public int BalanceId { get; private set; }
        public Money Money { get; private set; }

        public Transaction(int balanceId, Money money)
        {
            BalanceId = balanceId;
            Money = money;
        }


        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
