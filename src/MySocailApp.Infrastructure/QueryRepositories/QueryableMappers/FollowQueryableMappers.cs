using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowResponseDto> ToFollowerResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    follow => follow.FollowerId,
                    account => account.Id,
                    (follow, account) => new { follow, UserName = account.UserName.Value }
                )
                .Join(
                    context.Users,
                    join => join.follow.FollowerId,
                    user => user.Id,
                    (join, user) => new FollowResponseDto(
                        join.follow.Id,
                        join.follow.CreatedAt,
                        join.follow.FollowerId,
                        join.follow.FollowedId,
                        new (
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName,
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
        public static IQueryable<FollowResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    follow => follow.FollowedId,
                    account => account.Id,
                    (follow, account) => new { follow, UserName = account.UserName.Value }
                )
                .Join(
                    context.Users,
                    join => join.follow.FollowedId,
                    user => user.Id,
                    (join,user) => new FollowResponseDto(
                        join.follow.Id,
                        join.follow.CreatedAt,
                        join.follow.FollowerId,
                        join.follow.FollowedId,
                        null,
                        new(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(question => question.Id == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id),
                            user.Image
                        )
                    )
                );
    }
}
