using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.BalanceAggregate.Abstracts;
using MySocailApp.Domain.BalanceAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Repositories
{
    public class BalanceRepository(AppDbContext context) : IBalanceRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Balance balance, CancellationToken cancellationToken)
            => await _context.Balances.AddAsync(balance, cancellationToken);

        public Task<Balance?> GetAsync(int id, CancellationToken cancellationToken)
            => _context.Balances.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<bool> HasBalance(int id, CancellationToken cancellationToken)
            => _context.Balances.AnyAsync(x => x.Id == id && x.Credit.Amount > 0, cancellationToken);
    }
}
