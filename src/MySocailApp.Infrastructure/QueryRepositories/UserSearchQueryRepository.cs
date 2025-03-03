using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain.GetUsersSearched;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserSearchQueryRepository(AppDbContext context) : IUserSearchQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserSearchedResponseDto>> GetUsersSearched(int userId, int accuntId, IPage page, CancellationToken cancellationToken)
            => _context.UserSearchs
                .AsNoTracking()
                .Where(x => x.SearcherId == userId)
                .ToPage(page)
                .ToUserSearchedResponseDto(_context, accuntId)
                .ToListAsync(cancellationToken);
    }
}
