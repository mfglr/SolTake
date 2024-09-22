using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserSearchQueryableMapper
    {

        public static IQueryable<UserSearchResponseDto> JoinSearched(this IQueryable<UserSearch> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    usr => usr.SearchedId,
                    a => a.Id,
                    (usr, a) => new { usr, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.usr.SearchedId,
                    u => u.Id,
                    (j, u) => new UserSearchResponseDto(
                        j.usr.Id,
                        j.usr.SearcherId,
                        j.usr.SearchedId,
                        j.usr.CreatedAt,
                        null,
                        new AppUserResponseDto(
                            u.Id,
                            u.CreatedAt,
                            u.UpdatedAt,
                            j.a.UserName!,
                            u.Name,
                            u.Biography.Value,
                            u.HasImage,
                            context.Questions.Count(q => q.AppUserId == u.Id),
                            u.Followers.Count,
                            u.Followeds.Count,
                            u.Followeds.Any(x => x.FollowedId == accountId),
                            u.Followers.Any(x => x.FollowerId == accountId)
                        )
                    )
                );
    }
}
