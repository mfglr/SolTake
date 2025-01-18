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
                    context.Users,
                    comment => comment.UserId,
                    user => user.Id,
                    (comment, user) => new { comment, user } 
                )
                .Join(
                    context.Accounts,
                    join => join.comment.UserId,
                    account => account.Id,
                    (join, account) => new CommentResponseDto(
                        join.comment.Id,
                        join.comment.CreatedAt,
                        join.comment.UpdatedAt,
                        account.UserName.Value,
                        join.comment.UserId,
                        join.comment.IsEdited,
                        join.comment.Content.Value,
                        join.comment.Likes.Any(l => l.UserId == accountId),
                        join.comment.Likes.Count,
                        context.Comments.Count(c => c.ParentId == join.comment.Id),
                        join.comment.UserId == accountId,
                        join.comment.QuestionId,
                        join.comment.SolutionId,
                        join.comment.ParentId,
                        join.user.Image
                    )
                );
    }
}
