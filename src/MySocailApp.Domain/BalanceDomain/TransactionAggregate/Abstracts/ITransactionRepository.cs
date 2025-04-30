using MySocailApp.Domain.BalanceDomain.TransactionAggregate.Entities;

namespace MySocailApp.Domain.BalanceDomain.TransactionAggregate.Abstracts
{
    public interface ITransactionRepository
    {
        Task CreateAsync(Transaction transaction, CancellationToken cancellationToken);
    }
}
