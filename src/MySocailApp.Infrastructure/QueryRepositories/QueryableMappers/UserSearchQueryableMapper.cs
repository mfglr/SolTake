using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserSearchQueryableMapper
    {
        public static IQueryable<UserSearchResponseDto> ToUserSearchedResponseDto(this IQueryable<UserSearch> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    us => us.SearchedId,
                    account => account.Id,
                    (us, account) => new { us, UserName = account.UserName.Value }
                )
                .Join(
                    context.Users,
                    join => join.us.SearchedId,
                    user => user.Id,
                    (join, user) => new UserSearchResponseDto(
                        join.us.Id,
                        join.us.SearcherId,
                        join.us.SearchedId,
                        join.us.CreatedAt,
                        null,
                        new (
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(q => q.UserId == user.Id),
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
