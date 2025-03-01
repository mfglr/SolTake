using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserQueryRepository(AppDbContext context) : IUserQueryRepository
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
                .Where(x => x.UserName.Value.ToLower().Contains(userName.ToLower()))
                .ToUserResponseDto(_context,accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                    x =>
                        (
                            x.Searchers.Any(x => x.SearcherId == accountId) || 
                            _context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == x.Id)
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
