using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserUserFollowAggregate.Abstracts;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    internal class FollowWriteRepository(AppDbContext context) : IUserUserFollowWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(UserUserFollow follow, CancellationToken cancellationToken)
            => await _context.UserUserFollows.AddAsync(follow, cancellationToken);

        public void Delete(UserUserFollow follow)
            => _context.UserUserFollows.Remove(follow);

        public void DeleteRange(IEnumerable<UserUserFollow> follows)
            => _context.UserUserFollows.RemoveRange(follows);

        public Task<UserUserFollow?> GetAsync(int followerId, int followedId, CancellationToken cancellationToken)
            => _context.UserUserFollows.FirstOrDefaultAsync(x => x.FollowerId == followerId && x.FollowedId == followedId, cancellationToken);

        public  Task<List<UserUserFollow>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.UserUserFollows.Where(x => x.FollowerId == userId || x.FollowedId == userId).ToListAsync(cancellationToken);

        public Task<List<UserUserFollow>> GetListAsync(int userId0, int userId1, CancellationToken cancellationToken)
            => _context.UserUserFollows
                .Where(
                    x => 
                        (x.FollowerId == userId0 && x.FollowedId == userId1) ||
                        (x.FollowerId == userId1 && x.FollowedId == userId0)
                )
                .ToListAsync(cancellationToken);
    }
}
