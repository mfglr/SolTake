using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowResponseDto> ToFollowerResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowerId,
                    user => user.Id,
                    (follow, user) => new FollowResponseDto(
                        follow.Id,
                        follow.FollowerId,
                        user.UserName.Value,
                        user.Name,
                        user.Image,
                        context.Follows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                    )
                );

        public static IQueryable<FollowResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowedId,
                    user => user.Id,
                    (follow, user) => new FollowResponseDto(
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
