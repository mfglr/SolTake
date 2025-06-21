using SolTake.Core;
using SolTake.Domain.SubjectRequestAggregate.ValueObjects;

namespace SolTake.Domain.SubjectRequestAggregate.Entities
{
    public class SubjectRequest : Entity, IAggregateRoot
    {
        public int UserId { get; private set; }
        public int ExamId { get; private set; }
        public SubjectName SubjectName { get; private set; }
        public SubjectRequestState State { get; private set; } = SubjectRequestState.Pending;
        public SubjectRequestRejectionReason? Reason { get; private set; }

        private SubjectRequest() { }

        public SubjectRequest(int userId, int examId, SubjectName subjectName)
        {
            UserId = userId;
            ExamId = examId;
            SubjectName = subjectName;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;

        public void Approve()
        {
            State = SubjectRequestState.Approved;
            UpdatedAt = DateTime.UtcNow;
        }

        public void Reject(SubjectRequestRejectionReason reason)
        {
            State = SubjectRequestState.Rejected;
            Reason = reason;
            UpdatedAt = DateTime.UtcNow;
        }

    }
}
