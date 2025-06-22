using SolTake.Application.Queries.UserDomain;
using SolTake.Domain.UserUserSearchAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class UserSearchedQueryableMapper
    {
        public static IQueryable<UserUserSearchResponseDto> ToUserVisitedResponseDto(this IQueryable<UserUserSearch> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    uuv => uuv.SearchedId,
                    user => user.Id,
                    (uuv, user) => new UserUserSearchResponseDto(
                        uuv.Id,
                        uuv.SearchedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
