using MySocailApp.Application.Queries.UserDomain.FollowAggregate;
using MySocailApp.Domain.UserDomain.FollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowerResponseDto> ToFollowerResponseDto(this IQueryable<Follow> query, AppDbContext context)
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
                        user.Image
                    )
                );

        public static IQueryable<FollowedResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, AppDbContext context)
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
                        user.Image
                    )
                );
    }
}
