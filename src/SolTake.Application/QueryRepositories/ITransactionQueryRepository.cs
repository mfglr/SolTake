using MySocailApp.Application.Queries.TransactionAggregate;
using SolTake.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ITransactionQueryRepository
    {
        Task<List<TransactionResponseDto>> GetTransactionsByBalanceId(int balanceId, IPage page, CancellationToken cancellationToken);
    }
}
