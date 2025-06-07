using SolTake.Core;

namespace SolTake.Domain.TransactionAggregate.Entities
{
    public class Transaction : Entity, IAggregateRoot
    {
        public int BalanceId { get; private set; }
        public int NumberOfSol { get; private set; }

        public Transaction(int balanceId, int numberOfInputToken, int numberOfOutputToken, int solPerInputToken, int solPerOutputToken)
        {
            BalanceId = balanceId;
            NumberOfSol = -1 * numberOfInputToken * solPerInputToken + numberOfOutputToken * solPerOutputToken;
        }

        public Transaction(int balanceId, int numberOfSol)
        {
            BalanceId = balanceId;
            NumberOfSol = numberOfSol;
        }
        
        private Transaction() { }
        
        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
