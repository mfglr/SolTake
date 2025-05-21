using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.FollowAggregate
{
    public class FollowReadRepository(AppDbContext context) : IUserUserFollowReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int followerId, int followedId, CancellationToken cancellationToken)
            => _context.UserUserFollows.AnyAsync(x => x.FollowerId == followerId && x.FollowedId == followedId, cancellationToken);
    }
}
