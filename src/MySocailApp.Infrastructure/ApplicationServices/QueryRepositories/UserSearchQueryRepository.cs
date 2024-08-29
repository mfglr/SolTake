using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.Extetions.QueryableMappers;

namespace MySocailApp.Infrastructure.ApplicationServices.QueryRepositories
{
    public class UserSearchQueryRepository(AppDbContext context) : IUserSearchQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserSearchResponseDto>> GetUserSearcheds(int userId, int accuntId, IPage page, CancellationToken cancellationToken)
            => _context.UserSearchs
                .AsNoTracking()
                .Where(x => x.SearcherId == userId)
                .ToPage(page)
                .ToUserSearchedResponseDto(accuntId)
                .ToListAsync(cancellationToken);
    }
}
