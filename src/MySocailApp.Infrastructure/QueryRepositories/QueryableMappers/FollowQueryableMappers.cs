using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowerResponseDto> ToFollowerResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowerId,
                    user => user.Id,
                    (follow, user) => new FollowerResponseDto(
                        follow.Id,
                        follow.FollowerId,
                        user.UserName.Value,
                        user.Name,
                        user.Image,
                        context.Follows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                    )
                );

        public static IQueryable<FollowedResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowedId,
                    user => user.Id,
                    (follow, user) => new FollowedResponseDto(
                        follow.Id,
                        follow.FollowedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image,
                        context.Follows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                    )
                );
    }
}
