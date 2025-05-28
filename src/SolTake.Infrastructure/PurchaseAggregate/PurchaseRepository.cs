using Microsoft.EntityFrameworkCore;
using SolTake.Domain.PurchaseAggregate.Abstracts;
using SolTake.Domain.PurchaseAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.PurchaseAggregate
{
    public class PurchaseRepository(AppDbContext context) : IPurchaseRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Purchase purchase, CancellationToken cancellationToken)
            => await _context.Purchases.AddAsync(purchase,cancellationToken);

        public Task<bool> ExistAsync(string token, CancellationToken cancellationToken)
            => _context.Purchases.AnyAsync(x => x.Token == token, cancellationToken);
    }
}
