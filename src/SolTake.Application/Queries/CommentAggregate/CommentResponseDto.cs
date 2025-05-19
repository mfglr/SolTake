using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using SolTake.Core;
using SolTake.Domain.CommentAggregate.Entities;

namespace MySocailApp.Application.Queries.CommentAggregate
{
    public record CommentResponseDto(int Id, DateTime CreatedAt,DateTime? UpdatedAt, string UserName, int UserId,bool IsEdited,string Content,bool IsLiked,int NumberOfLikes,int NumberOfReplies, bool IsOwner, int? QuestionId,int? SolutionId,int? ParentId, Multimedia? Image)
    {
        public static CommentResponseDto Create(Comment comment, Login login) =>
            new(
                comment.Id,
                comment.CreatedAt,
                comment.UpdatedAt,
                login.UserName,
                comment.UserId,
                comment.IsEdited,
                comment.Content.Value,
                false,
                0,
                0,
                true,
                comment.QuestionId,
                comment.SolutionId,
                comment.ParentId,
                login.Image
            );

        public static CommentResponseDto Create(SolutionCommentNotificationCreatedDomainEvent @event) =>
            new(
                @event.Comment.Id,
                @event.Comment.CreatedAt,
                @event.Comment.UpdatedAt,
                @event.Login.UserName,
                @event.Login.UserId,
                @event.Comment.IsEdited,
                @event.Comment.Content.Value,
                false,
                0,
                0,
                false,
                null,
                @event.Comment.SolutionId,
                null,
                @event.Login.Image
            );
    }
}
