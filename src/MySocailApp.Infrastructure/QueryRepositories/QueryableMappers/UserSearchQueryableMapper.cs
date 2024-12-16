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
                    (us, account) => new { us, account.UserName }
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
                        new AppUserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            user.HasImage,
                            context.Questions.Count(q => q.AppUserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id)
                        )
                    )
                );



    }
}
