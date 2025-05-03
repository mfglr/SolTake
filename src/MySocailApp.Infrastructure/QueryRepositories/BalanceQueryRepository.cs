using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.BalanceAggregate.GetBalance;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
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
