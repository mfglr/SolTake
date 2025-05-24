using SolTake.Application.Queries.CommentAggregate;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.CommentUserLikeAggregate.Entities;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentUserLikeQueryableMappers
    {
        public static IQueryable<CommentUserLikeResponseDto> ToCommentUserLikeResponseDto(this IQueryable<CommentUserLike> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    cul => cul.UserId,
                    user => user.Id,
                    (cul,user) => new CommentUserLikeResponseDto(
                        cul.Id,
                        cul.UserId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );

    }
}
