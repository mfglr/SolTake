using MySocailApp.Domain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.NotificationAggregate
{
    public class NotificationResponseDto
    {
        public int Id { get; protected set; }
        public int OwnerId { get; protected set; }
        public DateTime CreatedAt { get; protected set; }
        public bool IsViewed { get; protected set; }
        public NotificationType Type { get; protected set; }
        public int? CommentId { get; private set; }
        public int? UserId { get; private set; }
        private NotificationResponseDto() { }
    }
}
