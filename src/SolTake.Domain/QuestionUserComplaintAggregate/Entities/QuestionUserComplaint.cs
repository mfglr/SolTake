using SolTake.Core;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;

namespace SolTake.Domain.QuestionUserComplaintAggregate.Entities
{
    public class QuestionUserComplaint : Entity, IAggregateRoot
    {
        public int QuestionId { get; private set; }
        public int UserId { get; private set; }
        public QuestionComplaintReason Reason { get; private set; }
        public QuestionComplaintContent? Content { get; private set; }
        public bool IsViewed { get; private set; }

        private QuestionUserComplaint() { }

        public QuestionUserComplaint(int questionId, int userId, QuestionComplaintReason reason, QuestionComplaintContent? content = null)
        {
            QuestionId = questionId;
            UserId = userId;
            Reason = reason;
            Content = content;
        }

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            IsViewed = false;
        }

        public void View()
        {
            IsViewed = true;
            UpdatedAt = DateTime.UtcNow;
        }

    }
}
