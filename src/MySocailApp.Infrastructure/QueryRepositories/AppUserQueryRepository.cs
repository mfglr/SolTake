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
                    _context.Accounts,
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
                        x.user.HasImage,
                        _context.Questions.Count(q => q.UserId == x.user.Id),
                        _context.Follows.Count(f => f.FollowedId == x.user.Id),
                        _context.Follows.Count(f => f.FollowerId == x.user.Id),
                        _context.Follows.Any(f => f.FollowerId == x.user.Id && f.FollowedId == accountId),
                        _context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == x.user.Id)
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
                .Join(
                    _context.Accounts,
                    user => user.Id,
                    account => account.Id,
                    (user, account) => new { user, account.UserName }
                )
                .Where(
                     join =>
                        (
                            join.user.Name != null &&
                            join.user.Name.ToLower().Contains(key.ToLower())
                        ) ||
                        join.UserName.Value.ToLower().Contains(key.ToLower())
                )
                .Where(x => x.user.Id < page.Offset)
                .OrderByDescending(x => x.user.Id)
                .Take(page.Take)
                .Select(
                    x => new UserResponseDto(
                        x.user.Id,
                        x.user.CreatedAt,
                        x.user.UpdatedAt,
                        x.UserName.Value,
                        x.user.Name,
                        x.user.Biography.Value,
                        x.user.HasImage,
                        _context.Questions.Count(q => q.UserId == x.user.Id),
                        _context.Follows.Count(f => f.FollowedId == x.user.Id),
                        _context.Follows.Count(f => f.FollowerId == x.user.Id),
                        _context.Follows.Any(f => f.FollowerId == x.user.Id && f.FollowedId == accountId),
                        _context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == x.user.Id)
                    )
                )
                .ToListAsync(cancellationToken);
    }
}
