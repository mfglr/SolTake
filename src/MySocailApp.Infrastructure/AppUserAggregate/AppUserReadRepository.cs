using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class AppUserReadRepository(AppDbContext context) : IAppUserReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<AppUser?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        
        public async Task<List<int>> GetIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .Where(x => userNames.Contains(x.Account.UserName))
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);
    }
}
