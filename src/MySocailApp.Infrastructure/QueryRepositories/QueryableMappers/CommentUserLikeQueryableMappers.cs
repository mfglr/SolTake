using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentUserLikeQueryableMappers
    {

        public static IQueryable<CommentUserLikeResponseDto> Join(this IQueryable<CommentUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    cul => cul.AppUserId,
                    a => a.Id,
                    (cul, a) => new { cul, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.cul.AppUserId,
                    u => u.Id,
                    (j, u) => new CommentUserLikeResponseDto(
                        j.cul.Id,
                        j.cul.CreatedAt,
                        j.cul.CommentId,
                        j.cul.AppUserId,
                        new (
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
                        )
                    )
                );
    }
}
