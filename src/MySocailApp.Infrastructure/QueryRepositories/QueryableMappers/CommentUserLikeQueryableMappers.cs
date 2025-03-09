using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentUserLikeQueryableMappers
    {
        public static IQueryable<CommentUserLikeResponseDto> ToCommentUserLikeResponseDto(this IQueryable<CommentUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    cul => cul.UserId,
                    user => user.Id,
                    (cul,user) => new CommentUserLikeResponseDto(
                        cul.Id,
                        cul.CreatedAt,
                        cul.CommentId,
                        cul.UserId,
                        new UserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
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
