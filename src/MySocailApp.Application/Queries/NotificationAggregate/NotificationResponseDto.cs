using MySocailApp.Domain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.NotificationAggregate
{
    public class NotificationResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int OwnerId { get; private set; }
        public int? UserId { get; private set; }
        public bool IsViewed { get; private set; }
        public NotificationType Type { get; private set; }
        public int? ParentId { get; private set; }
        public int? RepliedId { get; private set; }
        public int? CommentId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        private NotificationResponseDto() { }
    }
}
