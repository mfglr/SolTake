using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{

    public class AppUserWriteRepository(AppDbContext context) : IAppUserWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AppUser user, CancellationToken cancellationToken)
            => await _context.AppUsers.AddAsync(user, cancellationToken);

        public void Delete(AppUser user)
        {
            user.DeleteEntities();
            _context.AppUsers.Remove(user);
        }

        public async Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.AppUsers.FirstAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser?> GetWithAllAsync(int id, int userId, CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId))
                .Include(x => x.Followeds.Where(x => x.FollowedId == userId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == userId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser?> GetWithAllAsync(int id, CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Blockeds)
                .Include(x => x.Blockers)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser?> GetWithBlocker(int id, int userId, CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == followerId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<AppUser?> GetWithSearchedByIdAsync(int id, int searchedId, CancellationToken cancellationToken)
            => await _context.AppUsers
                .Include(x => x.Searcheds.Where(x => x.SearchedId == searchedId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
