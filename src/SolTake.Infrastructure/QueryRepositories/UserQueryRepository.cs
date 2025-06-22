using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.UserDomain;
using SolTake.Application.Queries.UserDomain.SearchUsers;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using System.Linq.Expressions;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal static class BlockFilter
    {
        public static IQueryable<User> Filter(this IQueryable<User> query, AppDbContext context, int? forUserId)
            =>
                query
                    .Where(
                        user =>
                            !context.UserUserBlocks.Any(
                                uub =>
                                    (uub.BlockerId == user.Id && uub.BlockedId == forUserId) ||
                                    (uub.BlockerId == forUserId && uub.BlockedId == user.Id)
                            )
                    );
    }

    internal class UserQueryRepository(AppDbContext context) : IUserQueryRepository
    {

        private readonly AppDbContext _context = context;

        private Task<UserResponseDto?> GetSingleAsync(int? forUserId, Expression<Func<User, bool>> predicate, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(predicate)
                .Filter(_context,forUserId)
                .ToUserResponseDto(_context, forUserId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<UserResponseDto?> GetByIdAsync(int id, int? forUserId, CancellationToken cancellationToken)
            => GetSingleAsync(forUserId, user => user.Id == id, cancellationToken);

        public Task<UserResponseDto?> GetByUserNameAsync(string userName, int? forUserId, CancellationToken cancellationToken)
            => GetSingleAsync(
                forUserId,
                user => user.UserName.Value.ToLower().Contains(userName.ToLower()),
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
                        user.UserName.Value.ToLower().Contains(key.ToLower())
                )
                .Filter(_context, forUserId)
                .ToPage(page)
                .ToSearchUserResponse()
                .ToListAsync(cancellationToken);
    }
}
