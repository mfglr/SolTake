using SolTake.Application.Queries.QuestionDomain;
using SolTake.Domain.QuestionUserLikeAggregate.Entities;
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
                        qul.UserId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );


    }
}
