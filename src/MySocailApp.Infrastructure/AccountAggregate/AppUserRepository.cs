using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class AppUserRepository(AppDbContext context) : IAppUserRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AppUser user, CancellationToken cancellationToken)
            => await _context.AppUsers.AddAsync(user,cancellationToken);

        public async Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.AppUsers.FirstAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser> GetWithAllAsync(int id,CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .Include(x => x.Blockeds)
                .Include(x => x.Blockers)
                .FirstAsync(x => x.Id == id, cancellationToken);
    }
}
