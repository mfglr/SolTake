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
                    context.Accounts,
                    qul => qul.UserId,
                    account => account.Id,
                    (qul, account) => new { qul, UserName = account.UserName.Value }
                )
                .Join(
                    context.Users,
                    join => join.qul.UserId,
                    user => user.Id,
                    (join, user) => new QuestionUserLikeResponseDto(
                        join.qul.Id,
                        join.qul.LikedAt,
                        join.qul.QuestionId,
                        join.qul.UserId,
                        user.Name,
                        join.UserName,
                        user.Image
                    )
                );


    }
}
