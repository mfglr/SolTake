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
            => _context.AppUsers.Remove(user);

        public Task<AppUser> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.AppUsers.FirstAsync(x => x.Id == id, cancellationToken);

        public Task<AppUser?> GetWithAllAsync(int id, int userId, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == userId))
                .Include(x => x.Followeds.Where(x => x.FollowedId == userId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<AppUser?> GetWithAllAsync(int id, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Followers)
                .Include(x => x.Followeds)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.UserFollowNotifications.Where(x => x.FollowerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<AppUser?> GetWithSearchedByIdAsync(int id, int searchedId, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Searcheds.Where(x => x.SearchedId == searchedId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
