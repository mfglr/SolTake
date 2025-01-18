using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.NotificationAggregate
{
    public class NotificationResponseDto(int id, DateTime createdAt, int ownerId, int appUserId, string userName, bool isViewed, NotificationType type, int? parentId, int? repliedId, int? commentId, string? commentContent, int? questionId, int? solutionId, Multimedia? image)
    {
        public int Id { get; private set; } = id;
        public DateTime CreatedAt { get; private set; } = createdAt;
        public int OwnerId { get; private set; } = ownerId;
        public int AppUserId { get; private set; } = appUserId;
        public string UserName { get; private set; } = userName;
        public bool IsViewed { get; private set; } = isViewed;
        public NotificationType Type { get; private set; } = type;
        public int? ParentId { get; private set; } = parentId;
        public int? RepliedId { get; private set; } = repliedId;
        public int? CommentId { get; private set; } = commentId;
        public string? CommentContent { get; private set; } = commentContent;
        public int? QuestionId { get; private set; } = questionId;
        public int? SolutionId { get; private set; } = solutionId;
        public Multimedia? Image { get; private set; } = image;
    }
}
