using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    public class FollowReadRepository(AppDbContext context) : IFollowReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int followerId, int followedId, CancellationToken cancellationToken)
            => _context.Follows.AnyAsync(x => x.FollowerId == followerId && x.FollowedId == followedId, cancellationToken);
    }
}
