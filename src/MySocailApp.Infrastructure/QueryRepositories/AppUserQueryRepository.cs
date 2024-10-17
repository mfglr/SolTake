using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class AppUserQueryRepository(AppDbContext context) : IAppUserQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<AppUserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToUserResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<AppUserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .ToUserResponseDto(_context, accountId)
                .FirstOrDefaultAsync(x => x.UserName == userName,cancellationToken);

        public Task<List<AppUserResponseDto>> GetNotFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(x => x.Id != userId && !x.Followers.Any(x => x.FollowerId == userId))
                .ToPage(page)
                .ToUserResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<AppUserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .Where(
                    x =>
                        (
                            x.Searchers.Any(x => x.SearcherId == accountId) || 
                            x.Followers.Any(x => x.FollowerId == accountId)
                        ) &&
                        x.Id != accountId
                )
                .ToPage(page)
                .ToUserResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<AppUserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.AppUsers
                .AsNoTracking()
                .ToUserResponseDto(_context, accountId)
                .Where(
                    x => 
                        (
                            x.Name != null && 
                            x.Name.ToLower().Contains(key.ToLower())
                        ) || 
                        x.UserName!.ToLower().Contains(key.ToLower())
                )
                .ToPage(page)
                .ToListAsync(cancellationToken);
    }
}
