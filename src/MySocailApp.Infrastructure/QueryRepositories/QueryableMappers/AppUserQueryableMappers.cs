using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class AppUserQueryableMappers
    {
        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<AppUser> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    user => user.Id,
                    account => account.Id,
                    (user,account) => new AppUserResponseDto(
                        user.Id,
                        user.CreatedAt,
                        user.UpdatedAt,
                        account.UserName!,
                        user.Name,
                        user.Biography.Value,
                        user.HasImage,
                        context.Questions.Count(x => x.AppUserId == x.Id),
                        context.Follows.Count(x => x.FollowedId == user.Id),
                        context.Follows.Count(x => x.FollowerId == user.Id),
                        context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                        context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id)
                    )
                );
    }
}
