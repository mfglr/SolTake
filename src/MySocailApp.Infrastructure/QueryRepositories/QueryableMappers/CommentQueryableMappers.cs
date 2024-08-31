using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentQueryableMappers
    {
        public static IQueryable<CommentResponseDto> ToCommentResponseDto(this IQueryable<Comment> query, int accountId)
            => query
                .Select(
                    x => new CommentResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.UpdatedAt,
                        x.AppUser.Account.UserName!,
                        x.AppUserId,
                        x.IsEdited,
                        x.Content.Value,
                        x.Likes.Any(x => x.AppUserId == accountId),
                        x.Likes.Count,
                        x.Replies.Count,
                        x.AppUserId == accountId,
                        x.QuestionId,
                        x.SolutionId,
                        x.ParentId
                    )
                );
    }
}
