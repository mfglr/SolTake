using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;
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
                .Where(
                    user =>
                        user.Id == id &&
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == user.Id && uub.BlockedId == accountId)
                )
                .ToUserResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<UserResponseDto?> GetByUserNameAsync(string userName, int accountId, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                    user => 
                        user.UserName.Value.ToLower().Contains(userName.ToLower()) &&
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == user.Id && uub.BlockedId == accountId)
                )
                .ToUserResponseDto(_context,accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                    user =>
                        (
                            _context.UserUserSearchs.Any(userSearch => userSearch.SearcherId == accountId && userSearch.SearchedId == user.Id) ||
                            _context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                        ) &&
                        user.Id != accountId &&
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == user.Id && uub.BlockedId == accountId)
                )
                .ToPage(page)
                .ToUserResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<SearchUserResponseDto>> SearchUserAsync(string key, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                     user =>
                        (
                            user.Name != null &&
                            user.Name.ToLower().Contains(key.ToLower())
                        ) ||
                        user.UserName.Value.ToLower().Contains(key.ToLower()) &&
                        !_context.UserUserBlocks.Any(uub => uub.BlockerId == user.Id && uub.BlockedId == accountId)
                )
                .ToPage(page)
                .ToSearchUserResponse()
                .ToListAsync(cancellationToken);
    }
}
