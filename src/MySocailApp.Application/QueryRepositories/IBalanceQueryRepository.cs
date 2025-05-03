using MySocailApp.Application.Queries.BalanceAggregate.GetBalance;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IBalanceQueryRepository
    {
        Task<BalanceResponseDto> GetBalanceAsync(int id,CancellationToken cancellationToken);
    }
}
