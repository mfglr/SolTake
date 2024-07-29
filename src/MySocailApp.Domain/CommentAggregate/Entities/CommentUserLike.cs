using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class CommentUserLike
    {
        public int QuestionCommentId { get; private set; }
        public int AppUserId { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private CommentUserLike(int questionCommentId, int appUserId)
        {
            QuestionCommentId = questionCommentId;
            AppUserId = appUserId;
        }

        public static CommentUserLike Create(int questionCommentId, int appUserId)
            => new(questionCommentId, appUserId) { CreatedAt = DateTime.UtcNow };

        // read only navigator property
        public Comment QuestionComment { get; }
        public AppUser AppUser { get; }

    }
}
