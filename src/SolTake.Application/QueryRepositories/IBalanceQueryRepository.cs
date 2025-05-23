using SolTake.Application.Queries.BalanceAggregate.GetBalance;

namespace SolTake.Application.QueryRepositories
{
    public interface IBalanceQueryRepository
    {
        Task<BalanceResponseDto> GetBalanceAsync(int id,CancellationToken cancellationToken);
    }
}
