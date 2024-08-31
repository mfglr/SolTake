using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class FollowQueryRepository(AppDbContext context) : IFollowQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<FollowResponseDto>> GetFollowersAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Follows
                .AsNoTracking()
                .Where(x => x.FollowedId == userId)
                .ToPage(page)
                .ToFollowerResponseDto(accountId)
                .ToListAsync(cancellationToken);

        public Task<List<FollowResponseDto>> GetFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
           => _context.Follows
                .AsNoTracking()
                .Where(x => x.FollowerId == userId)
                .ToPage(page)
                .ToFollowedResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
