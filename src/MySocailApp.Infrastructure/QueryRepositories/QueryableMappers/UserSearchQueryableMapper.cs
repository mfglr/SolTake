using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserSearchQueryableMapper
    {
        public static IQueryable<UserSearchResponseDto> ToUserSearchedResponseDto(this IQueryable<UserSearch> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.Users,
                    us => us.SearchedId,
                    user => user.Id,
                    (us, user) => new UserSearchResponseDto(
                        us.Id,
                        us.SearcherId,
                        us.SearchedId,
                        us.CreatedAt,
                        null,
                        new(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(q => q.UserId == user.Id),
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
