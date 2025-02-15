using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
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
                        follow.CreatedAt,
                        follow.FollowerId,
                        follow.FollowedId,
                        new(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(question => question.Id == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id),
                            user.Image
                        ),
                        null
                    )
                );

        public static IQueryable<FollowResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowedId,
                    user => user.Id,
                    (follow, user) => new FollowResponseDto(
                        follow.Id,
                        follow.CreatedAt,
                        follow.FollowerId,
                        follow.FollowedId,
                        null,
                        new(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(question => question.Id == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == userId),
                            context.Follows.Any(x => x.FollowerId == userId && x.FollowedId == user.Id),
                            user.Image
                        )
                    )
                );
    }
}
