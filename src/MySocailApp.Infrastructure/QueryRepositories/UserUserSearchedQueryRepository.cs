using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserUserSearchedQueryRepository(AppDbContext context) : IUserUserSearchQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserUserSearchResponseDto>> GetUsersSearched(int userId, IPage page, CancellationToken cancellationToken)
            => _context.UserUserSearchs
                .AsNoTracking()
                .Where(x => x.SearcherId == userId)
                .ToPage(page)
                .ToUserVisitedResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
