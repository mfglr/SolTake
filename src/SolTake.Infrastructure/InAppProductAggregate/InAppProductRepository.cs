using Microsoft.EntityFrameworkCore;
using SolTake.Domain.InAppProductAggregate.Abstracts;
using SolTake.Domain.InAppProductAggregate.Entities;
using SolTake.Domain.PurchaseAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.InAppProductAggregate
{
    public class InAppProductRepository(AppDbContext context) : IInAppProductRepository
    {
        private readonly AppDbContext _context = context;

        public Task<InAppProduct?> GetByProductIdAsync(string productId, CancellationToken cancellationToken)
            => _context.InAppProducts.AsNoTracking().FirstOrDefaultAsync(x => x.ProductId == productId, cancellationToken);
    }
}
