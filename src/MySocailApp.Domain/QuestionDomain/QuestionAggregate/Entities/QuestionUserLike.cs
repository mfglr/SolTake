using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class QuestionUserLike : IHasId
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }

        private QuestionUserLike(int userId) => UserId = userId;
        public static QuestionUserLike Create(int userId) => new(userId) { CreatedAt = DateTime.UtcNow };
    }
}
