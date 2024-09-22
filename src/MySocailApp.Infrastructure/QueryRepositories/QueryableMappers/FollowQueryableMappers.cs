using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowResponseDto> JoinFollower(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    f => f.FollowerId,
                    a => a.Id,
                    (f, a) => new { f, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.f.FollowerId,
                    u => u.Id,
                    (j, u) => new FollowResponseDto(
                        j.f.Id,
                        j.f.CreatedAt,
                        j.f.FollowerId,
                        j.f.FollowedId,
                        new(
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
                            u.Followeds.Any(f => f.FollowedId == accountId),
                            u.Followers.Any(f => f.FollowerId == accountId)
                        ),
                        null
                    )
                );

        public static IQueryable<FollowResponseDto> JoinFollowed(this IQueryable<Follow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    f => f.FollowedId,
                    a => a.Id,
                    (f, a) => new { f, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.f.FollowedId,
                    u => u.Id,
                    (j, u) => new FollowResponseDto(
                        j.f.Id,
                        j.f.CreatedAt,
                        j.f.FollowerId,
                        j.f.FollowedId,
                        new(
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
                            u.Followeds.Any(f => f.FollowedId == accountId),
                            u.Followers.Any(f => f.FollowerId == accountId)
                        ),
                        null
                    )
                );
    }
}
