using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppUserAggregate
{

    public class AppUserRepository(AppDbContext context) : IAppUserRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AppUser user, CancellationToken cancellationToken)
        {
            await _context.AppUsers.AddAsync(user, cancellationToken);
        }

        public void Delete(AppUser user)
        {
            user.DeleteEntities();
            _context.AppUsers.Remove(user);
        }

        public async Task<AppUser> GetByIdAsync(string id, CancellationToken cancellationToken)
        {
            return await _context.AppUsers.FirstAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithAllAsync(string id, string userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId))
                .Include(x => x.Followeds.Where(x => x.FollowedId == userId))
                .Include(x => x.Requesters.Where(x => x.RequesterId == userId))
                .Include(x => x.Requesteds.Where(x => x.RequestedId == userId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == userId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithAllAsync(string id, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .Include(x => x.Requesters)
                .Include(x => x.Requesteds)
                .Include(x => x.Blockeds)
                .Include(x => x.Blockers)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithBlocker(string id, string userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithFollowerByIdAsync(string id, string followerId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == followerId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithFollowerAndRequesterByIdAsync(string id, string userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId))
                .Include(x => x.Requesters.Where(x => x.RequesterId == userId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == userId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithRequesterByIdAsync(string id, string requesterId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Requesters.Where(x => x.RequesterId == requesterId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithRequestersById(string id, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Requesters)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetByIdWithFollowersAndFolloweds(string id, CancellationToken cancellationToken)
        {
            return await _context
                .AppUsers
                .AsNoTracking()
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
        }
    }
}
