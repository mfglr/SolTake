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
                    cul => cul.UserId,
                    account => account.Id,
                    (cul,account) => new { cul.Id, cul.CreatedAt, cul.CommentId, cul.UserId, account.UserName }
                )
                .Join(
                    context.Users,
                    join => join.UserId,
                    user => user.Id,
                    (join,user) => new CommentUserLikeResponseDto(
                        join.Id,
                        join.CreatedAt,
                        join.CommentId,
                        join.UserId,
                        new UserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(question => question.UserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id),
                            user.Image
                        )
                    )
                );

    }
}
