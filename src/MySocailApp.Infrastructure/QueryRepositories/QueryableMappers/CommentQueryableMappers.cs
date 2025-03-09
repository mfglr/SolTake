using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

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
                        comment.Likes.Any(l => l.UserId == accountId),
                        comment.Likes.Count,
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
