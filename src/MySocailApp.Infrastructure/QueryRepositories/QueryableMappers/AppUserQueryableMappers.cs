using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class AppUserQueryableMappers
    {

        public static IQueryable<AppUserResponseDto> Join(this IQueryable<AppUser> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    u => u.Id,
                    a => a.Id,
                    (u,a) => new AppUserResponseDto(
                        u.Id,
                        u.CreatedAt,
                        u.UpdatedAt,
                        a.UserName!,
                        u.Name,
                        u.Biography.Value,
                        u.HasImage,
                        context.Questions.Count(q => q.AppUserId == u.Id),
                        u.Followers.Count,
                        u.Followeds.Count,
                        u.Followeds.Any(x => x.FollowedId == accountId),
                        u.Followers.Any(x => x.FollowerId == accountId)
                    )
                );
    }
}
