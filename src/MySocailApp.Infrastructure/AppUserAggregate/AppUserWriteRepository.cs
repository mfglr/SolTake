using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate;
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
        {
            return await _context.AppUsers.FirstAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithAllAsync(int id, int userId, CancellationToken cancellationToken)
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

        public async Task<AppUser?> GetWithAllAsync(int id, CancellationToken cancellationToken)
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

        public async Task<AppUser?> GetWithBlocker(int id, int userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == followerId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithFollowerRequesterBlockedBlockerByIdAsync(int id, int userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId))
                .Include(x => x.Requesters.Where(x => x.RequesterId == userId))
                .Include(x => x.Blockeds.Where(x => x.BlockedId == userId))
                .Include(x => x.Blockers.Where(x => x.BlockerId == userId))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
        }
        
        public async Task<AppUser?> GetWithFollowerRequesterByIdAsync(int id, int userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId && !x.IsRemoved))
                .Include(x => x.Requesters.Where(x => x.RequesterId == userId && !x.IsRemoved))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
        }
        public async Task<AppUser?> GetWithFollowedRequestedByIdAsync(int id, int userId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Followeds.Where(x => x.FollowedId == userId && !x.IsRemoved))
                .Include(x => x.Requesteds.Where(x => x.RequestedId == userId && !x.IsRemoved))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
        }


        public async Task<AppUser?> GetWithRequestedByIdAsync(int id, int requestedId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Requesteds.Where(x => x.RequesterId == requestedId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }

        public async Task<AppUser?> GetWithRequesterByIdAsync(int id, int requesterId, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Requesters.Where(x => x.RequesterId == requesterId))
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsRemoved, cancellationToken);
        }

        public async Task<AppUser?> GetWithRequestersByIdAsync(int id, CancellationToken cancellationToken)
        {
            return await _context.AppUsers
                .Include(x => x.Requesters)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        }
    }
}
