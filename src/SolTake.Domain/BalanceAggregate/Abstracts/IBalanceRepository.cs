using SolTake.Domain.BalanceAggregate.Entities;

namespace SolTake.Domain.BalanceAggregate.Abstracts
{
    public interface IBalanceRepository
    {
        Task CreateAsync(Balance balance, CancellationToken cancellationToken);
        Task<Balance> GetAsync(int id, CancellationToken cancellationToken);
        Task<bool> HasBalance(int id, CancellationToken cancellationToken);
        Task<bool> HasDept(int id, CancellationToken cancellationToken);
        Task<int> GetBalanceAsync(int id, CancellationToken cancellationToken);
    }
}
