using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Domain.QuestionCommentAggregate.Entities
{
    public class QuestionCommentUserLike
    {
        public int QuestionCommentId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private QuestionCommentUserLike(int questionCommentId, int appUserId)
        {
            QuestionCommentId = questionCommentId;
            AppUserId = appUserId;
        }

        public static QuestionCommentUserLike Create(int questionCommentId, int appUserId)
            => new (questionCommentId, appUserId) { CreatedAt = DateTime.UtcNow };

        // read only navigator property
        public QuestionComment QuestionComment { get; }
        public AppUser AppUser { get; }

    }
}
