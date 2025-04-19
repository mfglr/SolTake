using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Application.Queries.UserDomain.SearchUsers;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using System.Linq.Expressions;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserQueryRepository(AppDbContext context) : IUserQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<UserResponseDto?> GetSingleAsync(int? forUserId, Expression<Func<User, bool>> predicate, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(predicate)
                .Where(
                    user =>
                        !_context.UserUserBlocks.Any(
                            uub => 
                                (uub.BlockerId == user.Id && uub.BlockedId == forUserId) ||
                                (uub.BlockerId == forUserId && uub.BlockedId == user.Id)
                        )
                )
                .ToUserResponseDto(_context, forUserId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<UserResponseDto>> GetListAsync(int? forUserId, IPage page, Expression<Func<User, bool>> predicate, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(predicate)
                .Where(
                    user =>
                        !_context.UserUserBlocks.Any(
                            uub =>
                                (uub.BlockerId == user.Id && uub.BlockedId == forUserId) ||
                                (uub.BlockerId == forUserId && uub.BlockedId == user.Id)
                        )
                )
                .ToUserResponseDto(_context, forUserId)
                .ToListAsync(cancellationToken);

        public Task<UserResponseDto?> GetByIdAsync(int id, int? forUserId, CancellationToken cancellationToken)
            => GetSingleAsync(forUserId, user => user.Id == id, cancellationToken);

        public Task<UserResponseDto?> GetByUserNameAsync(string userName, int? forUserId, CancellationToken cancellationToken)
            => GetSingleAsync(
                forUserId,
                user => user.UserName.Value.ToLower().Contains(userName.ToLower()),
                cancellationToken
            );

        public Task<List<UserResponseDto>> GetCreateConversationPageUsersAsync(int? forUserId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                forUserId,
                page,
                user =>
                    (
                        _context.UserUserSearchs.Any(userSearch => userSearch.SearcherId == forUserId && userSearch.SearchedId == user.Id) ||
                        _context.UserUserFollows.Any(follow => follow.FollowerId == forUserId && follow.FollowedId == user.Id)
                    ) &&
                    user.Id != forUserId,
                cancellationToken
            );

        public Task<List<SearchUserResponseDto>> SearchUserAsync(string key, int? forUserId, IPage page, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(
                     user =>
                        (
                            user.Name != null &&
                            user.Name.ToLower().Contains(key.ToLower())
                        ) ||
                        user.UserName.Value.ToLower().Contains(key.ToLower()) &&
                        !_context.UserUserBlocks.Any(
                            uub =>
                                (uub.BlockerId == user.Id && uub.BlockedId == forUserId) ||
                                (uub.BlockerId == forUserId && uub.BlockedId == user.Id)
                        )
                )
                .ToPage(page)
                .ToSearchUserResponse()
                .ToListAsync(cancellationToken);
    }
}
