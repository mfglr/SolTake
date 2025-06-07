using SolTake.Core;

namespace SolTake.Domain.InAppProductAggregate.Entities
{
    public class InAppProduct(string productId, int numberOfSol) : Entity, IAggregateRoot
    {
        public string ProductId { get; private set; } = productId;
        public int NumberOfSol { get; private set; } = numberOfSol;
    }
}
