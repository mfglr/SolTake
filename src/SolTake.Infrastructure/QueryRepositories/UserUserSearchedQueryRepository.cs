using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain;
using SolTake.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserUserSearchedQueryRepository(AppDbContext context) : IUserUserSearchQueryRepository
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
