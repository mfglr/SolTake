using SolTake.Domain.TransactionAggregate.Abstracts;
using SolTake.Domain.TransactionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.Repositories
{
    public class TransactionRepository(AppDbContext context) : ITransactionRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Transaction transaction, CancellationToken cancellationToken)
            => await _context.Transactions.AddAsync(transaction,cancellationToken);
    }
}
