using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class QuestionLikeNotification(int appUserId)
    {
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; } = appUserId;

        public Question Question { get; } = null!;
        public AppUser AppUser { get; } = null!;
    }
}
