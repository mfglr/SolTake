using MySocailApp.Core;
using MySocailApp.Core.AIModel;

namespace MySocailApp.Domain.TransactionAggregate.Entities
{
    public class Transaction : Entity, IAggregateRoot
    {
        private Transaction() { }

        public int BalanceId { get; private set; }
        public AIModel Model { get; private set; }

        public Transaction(int balanceId, AIModel model)
        {
            BalanceId = balanceId;
            Model = model;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
