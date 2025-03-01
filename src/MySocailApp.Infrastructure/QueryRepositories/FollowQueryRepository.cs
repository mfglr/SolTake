using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class FollowQueryRepository(AppDbContext context) : IFollowQueryRepository
    {
        private readonly AppDbContext _context = context;


        public Task<FollowerResponseDto?> GetFollowerAsync(int followId, CancellationToken cancellationToken)
            => _context.Follows
                .AsNoTracking()
                .Where(x => x.Id == followId)
                .ToFollowerResponseDto(_context)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<FollowerResponseDto>> GetFollowersByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken)
            => _context.Follows
                .AsNoTracking()
                .Where(x => x.FollowedId == userId)
                .ToPage(page)
                .ToFollowerResponseDto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<FollowedResponseDto>> GetFollowedsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken)
           => _context.Follows
                .AsNoTracking()
                .Where(x => x.FollowerId == userId)
                .ToPage(page)
                .ToFollowedResponseDto(_context)
                .ToListAsync(cancellationToken);

        
    }
}
