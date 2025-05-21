using SolTake.Domain.TransactionAggregate.Entities;

namespace SolTake.Domain.TransactionAggregate.Abstracts
{
    public interface ITransactionRepository
    {
        Task CreateAsync(Transaction transaction, CancellationToken cancellationToken);
    }
}
