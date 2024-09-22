using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> Join(this IQueryable<QuestionUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    qul => qul.AppUserId,
                    a => a.Id,
                    (qul, a) => new { qul, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.qul.AppUserId,
                    u => u.Id,
                    (j, u) => new QuestionUserLikeResponseDto(
                        j.qul.Id,
                        j.qul.CreatedAt,
                        j.qul.QuestionId,
                        j.qul.AppUserId,
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
                            u.Followeds.Any(x => x.FollowedId == accountId),
                            u.Followers.Any(x => x.FollowerId == accountId)
                        )
                    )
                );
    }
}
