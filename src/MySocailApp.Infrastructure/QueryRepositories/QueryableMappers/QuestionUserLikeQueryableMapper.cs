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
                    qul => qul.AppUserId,
                    account => account.Id,
                    (qul, account) => new { qul, account.UserName }
                )
                .Join(
                    context.Users,
                    join => join.qul.AppUserId,
                    user => user.Id,
                    (join, user) => new QuestionUserLikeResponseDto(
                        join.qul.Id,
                        join.qul.CreatedAt,
                        join.qul.QuestionId,
                        join.qul.AppUserId,
                        new AppUserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            user.HasImage,
                            context.Questions.Count(q => q.UserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(f => f.FollowerId == user.Id && f.FollowedId == accountId),
                            context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == user.Id)
                        )
                    )
                );


    }
}
