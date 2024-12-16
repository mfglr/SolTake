using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentQueryableMappers
    {
        public static IQueryable<CommentResponseDto> ToCommentResponseDto(this IQueryable<Comment> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    comment => comment.AppUserId,
                    account => account.Id,
                    (comment, account) => new CommentResponseDto(
                        comment.Id,
                        comment.CreatedAt,
                        comment.UpdatedAt,
                        account.UserName.Value,
                        comment.AppUserId,
                        comment.IsEdited,
                        comment.Content.Value,
                        comment.Likes.Any(l => l.AppUserId == accountId),
                        comment.Likes.Count,
                        context.Comments.Count(c => c.ParentId == comment.Id),
                        comment.AppUserId == accountId,
                        comment.QuestionId,
                        comment.SolutionId,
                        comment.ParentId
                    )
                );
    }
}
