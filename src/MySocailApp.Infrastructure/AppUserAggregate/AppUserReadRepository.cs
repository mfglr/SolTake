using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Entities;
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
    }
}
