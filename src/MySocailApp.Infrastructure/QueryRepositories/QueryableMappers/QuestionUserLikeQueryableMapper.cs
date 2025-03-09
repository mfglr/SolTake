using MySocailApp.Application.Queries.QuestionDomain;
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
                        qul.CreatedAt,
                        qul.QuestionId,
                        qul.UserId,
                        user.Name,
                        user.UserName.Value,
                        user.Image
                    )
                );


    }
}
