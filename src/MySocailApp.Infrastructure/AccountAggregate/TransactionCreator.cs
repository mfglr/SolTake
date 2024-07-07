using Microsoft.EntityFrameworkCore.Storage;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class TransactionCreator(AppDbContext context) : ITransactionCreator
    {
        private readonly AppDbContext _context = context;

        public async Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken)
            => await _context.Database.BeginTransactionAsync(cancellationToken);
    }
}
