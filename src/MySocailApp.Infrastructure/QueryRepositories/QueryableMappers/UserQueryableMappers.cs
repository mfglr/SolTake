using MySocailApp.Application.Queries.UserDomain.UserAggregate;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserQueryableMappers
    {
        public static IQueryable<UserResponseDto> ToUserResponseDto(this IQueryable<User> query, AppDbContext context, int accountId)
            => query
                .Select(
                    user => new UserResponseDto(
                        user.Id,
                        user.CreatedAt,
                        user.UpdatedAt,
                        user.UserName.Value,
                        user.Name,
                        user.Biography.Value,
                        context.Questions.Count(question => question.UserId == user.Id),
                        context.Follows.Count(follow => follow.FollowedId == user.Id),
                        context.Follows.Count(follow => follow.FollowerId == user.Id),
                        context.Follows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.Follows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id),
                        user.Image
                    )
                );
    }
}
