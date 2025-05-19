using Microsoft.EntityFrameworkCore;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Domain.BalanceAggregate.Abstracts;
using SolTake.Domain.BalanceAggregate.Entities;

namespace MySocailApp.Infrastructure.Repositories
{
    public class BalanceRepository(AppDbContext context) : IBalanceRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Balance balance, CancellationToken cancellationToken)
            => await _context.Balances.AddAsync(balance, cancellationToken);

        public Task<Balance> GetAsync(int id, CancellationToken cancellationToken)
            => _context.Balances.FirstAsync(x => x.Id == id, cancellationToken);

        public Task<int> GetBalanceAsync(int id, CancellationToken cancellationToken)
            => _context.Balances
                .AsNoTracking()
                .Where(x => x.Id == id)
                .Select(x => x.Credit.Amount)
                .FirstAsync(cancellationToken);

        public Task<bool> HasBalance(int id, CancellationToken cancellationToken)
            => _context.Balances.AnyAsync(x => x.Id == id && x.Credit.Amount > 0.0m, cancellationToken);

        public Task<bool> HasDept(int id, CancellationToken cancellationToken)
            => _context.Balances.AnyAsync(x => x.Id == id && x.Credit.Amount < 0.0m, cancellationToken);
    }
}
