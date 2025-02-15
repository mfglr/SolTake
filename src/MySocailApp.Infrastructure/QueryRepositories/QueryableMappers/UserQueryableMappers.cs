using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserQueryableMappers
    {
        public static IQueryable<UserResponseDto> ToUserResponseDto(this IQueryable<User> query, AppDbContext context, int accountId)
            => query
                .Select(
                    x => new UserResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.UpdatedAt,
                        x.UserName.Value,
                        x.Name,
                        x.Biography.Value,
                        context.Questions.Count(x => x.UserId == x.Id),
                        context.Follows.Count(x => x.FollowedId == x.Id),
                        context.Follows.Count(x => x.FollowerId == x.Id),
                        context.Follows.Any(x => x.FollowerId == x.Id && x.FollowedId == accountId),
                        context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == x.Id),
                        x.Image
                    )
                );
    }
}
