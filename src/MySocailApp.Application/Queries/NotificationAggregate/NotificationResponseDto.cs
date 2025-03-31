using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.NotificationAggregate
{
    public record NotificationResponseDto(int Id, DateTime CreatedAt, int OwnerId, int UserId, string UserName, bool IsViewed, NotificationType Type, int? ParentId, int? RepliedId, int? CommentId, string? CommentContent, int? QuestionId, int? SolutionId, Multimedia? Image)
    {
        public static NotificationResponseDto Create(QuestionLikedNotificationCreatedDomainEvent @event) =>
            new(
                @event.Notification.Id,
                @event.Notification.CreatedAt,
                @event.Notification.OwnerId,
                @event.Notification.UserId,
                @event.Login.UserName,
                @event.Notification.IsViewed,
                @event.Notification.Type,
                null,
                null,
                null,
                null,
                @event.Notification.QuestionId,
                null,
                @event.Login.Image
            );

        public static NotificationResponseDto Create(QuestionCommentNotificationCreatedDomainEvent @event) =>
            new(
                @event.Notification.Id,
                @event.Notification.CreatedAt,
                @event.Notification.OwnerId,
                @event.Notification.UserId,
                @event.Login.UserName,
                @event.Notification.IsViewed,
                @event.Notification.Type,
                null,
                null,
                @event.Notification.CommentId,
                @event.Comment.Content.Value,
                @event.Comment.QuestionId,
                null,
                @event.Login.Image
            );

        public static NotificationResponseDto Create(SolutionCommentNotificationCreatedDomainEvent @event) =>
            new(
                @event.Notification.Id,
                @event.Notification.CreatedAt,
                @event.Notification.OwnerId,
                @event.Notification.UserId,
                @event.Login.UserName,
                @event.Notification.IsViewed,
                @event.Notification.Type,
                null,
                null,
                @event.Notification.CommentId,
                @event.Comment.Content.Value,
                null,
                @event.Comment.SolutionId,
                @event.Login.Image
            );
    }
}
