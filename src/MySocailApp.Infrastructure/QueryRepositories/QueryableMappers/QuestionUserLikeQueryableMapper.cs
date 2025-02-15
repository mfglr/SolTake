using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> ToQuestionUserLikeResponseDto(this IQueryable<QuestionUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    qul => qul.UserId,
                    user => user.Id,
                    (qul, user) => new QuestionUserLikeResponseDto(
                        qul.Id,
                        qul.CreatedAt,
                        qul.QuestionId,
                        qul.UserId,
                        new (
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(q => q.UserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(f => f.FollowerId == user.Id && f.FollowedId == accountId),
                            context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == user.Id),
                            user.Image
                        )
                    )
                );


    }
}
