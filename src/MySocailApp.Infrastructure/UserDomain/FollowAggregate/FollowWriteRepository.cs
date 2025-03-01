using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    internal class FollowWriteRepository(AppDbContext context) : IFollowWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Follow follow, CancellationToken cancellationToken)
            => await _context.Follows.AddAsync(follow, cancellationToken);

        public void Delete(Follow follow)
            => _context.Follows.Remove(follow);

        public void DeleteRange(IEnumerable<Follow> follows)
            => _context.Follows.RemoveRange(follows);

        public Task<Follow?> GetAsync(int followerId, int followedId, CancellationToken cancellationToken)
            => _context.Follows.FirstOrDefaultAsync(x => x.FollowerId == followerId && x.FollowedId == followedId, cancellationToken);

        public  Task<List<Follow>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.Follows.Where(x => x.FollowerId == userId || x.FollowedId == userId).ToListAsync(cancellationToken);
    }
}
