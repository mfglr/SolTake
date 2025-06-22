using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.UserDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class UserUserSearchedQueryRepository(AppDbContext context) : IUserUserSearchQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserUserSearchResponseDto>> GetUsersSearched(int userId, int forUserId, IPage page, CancellationToken cancellationToken)
            => _context.UserUserSearchs
                .AsNoTracking()
                .Where(uus => uus.SearcherId == userId)
                .ToPage(page)
                .ToUserVisitedResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
