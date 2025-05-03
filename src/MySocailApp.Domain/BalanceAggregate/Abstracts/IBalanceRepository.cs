using MySocailApp.Domain.BalanceAggregate.Entities;

namespace MySocailApp.Domain.BalanceAggregate.Abstracts
{
    public interface IBalanceRepository
    {
        Task CreateAsync(Balance balance, CancellationToken cancellationToken);
        Task<Balance?> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> HasBalance(int id, CancellationToken cancellationToken);
    }
}
