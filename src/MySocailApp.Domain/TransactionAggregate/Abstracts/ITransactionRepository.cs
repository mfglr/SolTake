using MySocailApp.Domain.TransactionAggregate.Entities;

namespace MySocailApp.Domain.TransactionAggregate.Abstracts
{
    public interface ITransactionRepository
    {
        Task CreateAsync(Transaction transaction, CancellationToken cancellationToken);
    }
}
