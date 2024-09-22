using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class AppUserReadRepository(AppDbContext context) : IAppUserReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<AppUser?> GetAsync(int id, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        
        public Task<List<int>> GetIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Join(
                    _context.Users,
                    u => u.Id,
                    a => a.Id,
                    (u, a) => new { u, a }
                )
                .Where(x => userNames.Contains(x.a.UserName))
                .Select(x => x.a.Id)
                .ToListAsync(cancellationToken);
    }
}
