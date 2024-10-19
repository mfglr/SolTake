using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate.Abstracts;
using MySocailApp.Domain.AppUserAggregate.Entities;
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

        public Task<AppUser?> GetWithFollowerByIdAsync(int id, int followerId, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Followers.Where(x => x.FollowerId == followerId))
                .Include(x => x.UserFollowNotifications.Where(x => x.FollowerId == followerId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<AppUser?> GetWithSearcherByIdAsync(int id, int searcherId, CancellationToken cancellationToken)
            => _context.AppUsers
                .Include(x => x.Searchers.Where(x => x.SearcherId == searcherId))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task DeleteFollowsByUserId(int userId, CancellationToken cancellationToken)
        {
            var follows = await _context.Follows.Where(x => x.FollowerId == userId).ToListAsync(cancellationToken);
            _context.Follows.RemoveRange(follows);
        }
        
        public async Task DeleteFollowNotificationsByUserId(int userId, CancellationToken cancellationToken)
        {
            var notifications = await _context.UserFollowNotifications.Where(x => x.FollowerId == userId).ToListAsync(cancellationToken);
            _context.UserFollowNotifications.RemoveRange(notifications);
        }

        public async Task DeleteUserSerchsByUserId(int userId, CancellationToken cancellationToken)
        {
            var searchs = await _context.UserSearchs.Where(x => x.SearcherId == userId).ToListAsync(cancellationToken);
            _context.UserSearchs.RemoveRange(searchs);
        }

     
    }
}
