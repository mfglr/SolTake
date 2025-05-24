using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.BalanceAggregate.GetBalance;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class BalanceQueryRepository(AppDbContext context) : IBalanceQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<BalanceResponseDto> GetBalanceAsync(int id, CancellationToken cancellationToken)
            => _context.Balances
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToBalanceResponseDto()
                .FirstAsync(cancellationToken);
    }
}
