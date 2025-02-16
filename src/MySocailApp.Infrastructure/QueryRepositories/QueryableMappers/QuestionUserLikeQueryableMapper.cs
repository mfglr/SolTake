using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
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
                    (join, user) => new QuestionUserLikeResponseDto(
                        join.qul.Id,
                        join.qul.LikedAt,
                        join.qul.QuestionId,
                        join.qul.UserId,
                        user.Name,
                        join.UserName,
                        user.Image
                    )
                    )
                );


    }
}
