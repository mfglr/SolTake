using MySocailApp.Application.Queries.QuestionDomain.QuestionUserLikeAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> ToQuestionUserLikeResponseDto(this IQueryable<QuestionUserLike> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    qul => qul.UserId,
                    user => user.Id,
                    (qul, user) => new QuestionUserLikeResponseDto(
                        qul.Id,
                        qul.LikedAt,
                        qul.QuestionId,
                        qul.UserId,
                        user.Name,
                        user.UserName.Value,
                        user.Image
                    )
                );


    }
}
