using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentQueryableMappers
    {
        public static IQueryable<CommentResponseDto> ToCommentResponseDto(this IQueryable<Comment> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    comment => comment.UserId,
                    user => user.Id,
                    (comment, user) => new CommentResponseDto(
                        comment.Id,
                        comment.CreatedAt,
                        comment.UpdatedAt,
                        user.UserName.Value,
                        comment.UserId,
                        comment.IsEdited,
                        comment.Content.Value,
                        context.CommentUserLikes.Any(cul => cul.CommentId == comment.Id && cul.UserId == accountId),
                        context.CommentUserLikes.Count(cul => cul.CommentId == comment.Id),
                        context.Comments.Count(c => c.ParentId == comment.Id),
                        comment.UserId == accountId,
                        comment.QuestionId,
                        comment.SolutionId,
                        comment.ParentId,
                        user.Image
                    )
                );
    }
}
