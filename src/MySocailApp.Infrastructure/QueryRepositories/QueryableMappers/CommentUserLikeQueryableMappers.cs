using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentUserLikeQueryableMappers
    {
        public static IQueryable<CommentUserLikeResponseDto> ToCommentUserLikeResponseDto(this IQueryable<CommentUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    cul => cul.AppUserId,
                    account => account.Id,
                    (cul,account) => new { cul.Id, cul.CreatedAt, cul.CommentId, cul.AppUserId, account.UserName }
                )
                .Join(
                    context.Users,
                    join => join.AppUserId,
                    user => user.Id,
                    (join,user) => new CommentUserLikeResponseDto(
                        join.Id,
                        join.CreatedAt,
                        join.CommentId,
                        join.AppUserId,
                        new AppUserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            user.HasImage,
                            context.Questions.Count(question => question.AppUserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id)
                        )
                    )
                );

    }
}
