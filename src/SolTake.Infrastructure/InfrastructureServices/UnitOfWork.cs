using SolTake.Application.InfrastructureServices;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.InfrastructureServices
{
    public class UnitOfWork(AppDbContext context) : IUnitOfWork
    {
        private readonly AppDbContext _context = context;

        public async Task CommitAsync(CancellationToken cancellationToken)
            => await _context.SaveChangesAsync(cancellationToken);
        public void Clear() => _context.ChangeTracker.Clear();
    }
}
