using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.TransactionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class TransactionQueryRepository(AppDbContext context) : ITransactionQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TransactionResponseDto>> GetTransactionsByBalanceId(int balanceId, IPage page, CancellationToken cancellationToken)
            => _context.Transactions
                .AsNoTracking()
                .Where(x => x.BalanceId == balanceId)
                .ToPage(page)
                .ToTransactionResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
