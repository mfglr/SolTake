using MySocailApp.Core;

namespace MySocailApp.Domain.TransactionAggregate.Entities
{
    public class Transaction : Entity, IAggregateRoot
    {

        public int BalanceId { get; private set; }
        public int AIModelId { get; private set; }
        public int NumberOfInputToken { get; private set; }
        public int NumberOfOutputToken { get; private set; }
        public int SolPerInputToken { get; private set; }
        public int SolPerOutputToken { get; private set; }

        public Transaction(int balanceId, int aiModelId, int numberOfInputToken, int numberOfOutputToken, int solPerInputToken, int solPerOutputToken)
        {
            BalanceId = balanceId;
            AIModelId = aiModelId;
            NumberOfInputToken = numberOfInputToken;
            NumberOfOutputToken = numberOfOutputToken;
            SolPerInputToken = solPerInputToken;
            SolPerOutputToken = solPerOutputToken;
        }
        
        private Transaction() { }
        
        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
