using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.TransactionAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class TransactionQueryRepository(AppDbContext context) : ITransactionQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TransactionResponseDto>> GetTransactionsByBalanceId(int balanceId, IPage page, CancellationToken cancellationToken)
            => _context.Transactions
                .AsNoTracking()
                .Where(x => x.BalanceId == balanceId)
                .ToPage(page)
                .ToTransactionResponseDto()
                .ToListAsync(cancellationToken);
    }
}
