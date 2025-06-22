using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.UserDomain.GetFollowedsByUserId;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class FollowQueryRepository(AppDbContext context) : IFollowQueryRepository
    {
        private readonly AppDbContext _context = context;


        public Task<FollowResponseDto?> GetFollowerAsync(int followId, int accountId, CancellationToken cancellationToken)
            => _context.UserUserFollows
                .AsNoTracking()
                .Where(x => x.Id == followId)
                .ToFollowerResponseDto(_context,accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<FollowResponseDto>> GetFollowersByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken)
            => _context.UserUserFollows
                .AsNoTracking()
                .Where(x => x.FollowedId == userId)
                .ToPage(page)
                .ToFollowerResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<FollowResponseDto>> GetFollowedsByUserIdAsync(int userId, IPage page, int accountId, CancellationToken cancellationToken)
           => _context.UserUserFollows
                .AsNoTracking()
                .Where(x => x.FollowerId == userId)
                .ToPage(page)
                .ToFollowedResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        
    }
}
