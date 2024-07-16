using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionUserLike
    {
        public DateTime CreatetAt { get; private set; }
        public int QuestionId { get; private set; }
        public int AppUserId { get; private set; }
        public Question Question { get; }
        public AppUser AppUser { get; }


        private QuestionUserLike(int questionId, int appUserId)
        {
            QuestionId = questionId;
            AppUserId = appUserId;
        }

        public static QuestionUserLike Create(int questionId, int appUserId)
            => new(questionId, appUserId) { CreatetAt = DateTime.UtcNow };
    }
}
