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

        public Task<UserResponseDto?> GetByIdAsync(int id, int accountId, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToUserResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<UserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Join(
                    _context.Users,
                    user => user.Id,
                    account => account.Id,
                    (user, account) => new { user, account.UserName }
                )
                .Where(join => join.UserName!.Value.ToLower().Contains(userName.ToLower()))
                .Select(
                    x => new UserResponseDto(
                        x.user.Id,
                        x.user.CreatedAt,
                        x.user.UpdatedAt,
                        x.UserName.Value,
                        x.user.Name,
                        x.user.Biography.Value,
                        _context.Questions.Count(q => q.UserId == x.user.Id),
                        _context.Follows.Count(f => f.FollowedId == x.user.Id),
                        _context.Follows.Count(f => f.FollowerId == x.user.Id),
                        _context.Follows.Any(f => f.FollowerId == x.user.Id && f.FollowedId == accountId),
                        _context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == x.user.Id),
                        x.user.Image
                    )
                )
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<UserResponseDto>> GetNotFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(x => x.Id != userId && !x.Followers.Any(x => x.FollowerId == userId))
                .ToPage(page)
                .ToUserResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
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

        public Task<List<UserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                     user =>
                        (
                            user.Name != null &&
                            user.Name.ToLower().Contains(key.ToLower())
                        ) ||
                        user.UserName.Value.ToLower().Contains(key.ToLower())
                )
                .ToPage(page)
                .ToUserResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
