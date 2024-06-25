using Microsoft.EntityFrameworkCore.Storage;
using MySocailApp.Application.Services;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Services
{
    public class TransactionCreator(AppDbContext context) : ITransactionCreator
    {
        private readonly AppDbContext _context = context;

        public async Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken)
        {
            return await _context.Database.BeginTransactionAsync(cancellationToken);
        }
    }
}
