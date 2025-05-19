using MySocailApp.Domain.TransactionAggregate.Abstracts;
using MySocailApp.Domain.TransactionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Repositories
{
    public class TransactionRepository(AppDbContext context) : ITransactionRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Transaction transaction, CancellationToken cancellationToken)
            => await _context.Transactions.AddAsync(transaction,cancellationToken);
    }
}
