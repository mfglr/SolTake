using MySocailApp.Application.Services;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Services
{
    public class UnitOfWork(AppDbContext context) : IUnitOfWork
    {
        private readonly AppDbContext _context = context;

        public async Task CommitAsync(CancellationToken cancellationToken)
        {
            await _context.SaveChangesAsync(cancellationToken);
        }
    }
}
