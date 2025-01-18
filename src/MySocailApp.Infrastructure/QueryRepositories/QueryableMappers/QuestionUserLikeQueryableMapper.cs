using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> ToQuestionUserLikeResponseDto(this IQueryable<QuestionUserLike> query, AppDbContext context, int accountId)
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
                        join.qul.CreatedAt,
                        join.qul.QuestionId,
                        join.qul.UserId,
                        new UserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName,
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
