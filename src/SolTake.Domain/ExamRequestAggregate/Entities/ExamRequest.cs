using SolTake.Core;
using SolTake.Domain.ExamRequestAggregate.Exceptions;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;

namespace SolTake.Domain.ExamRequestAggregate.Entities
{
    public class ExamRequest : Entity, IAggregateRoot
    {
        public int UserId { get; private set; }
        public ExamRequestName Name { get; private set; }
        public ExamRequestInitialism Initialism { get; private set; }
        public ExamRequestState State { get; private set; }
        public ExamRequestRejectionReason? Reason { get; private set; }

        private ExamRequest() { }

        public ExamRequest(int userId, ExamRequestName name, ExamRequestInitialism initialism)
        {
            UserId = userId;
            Name = name;
            Initialism = initialism;
        }

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            State = ExamRequestState.Pending;
        }

        public void Approve()
        {
            if (State != ExamRequestState.Pending)
                throw new InvalidExamRequestStateChangeException();

            UpdatedAt = DateTime.UtcNow;
            State = ExamRequestState.Approve;
        }

        public void Reject(ExamRequestRejectionReason reason)
        {
            if (State != ExamRequestState.Pending)
                throw new InvalidExamRequestStateChangeException();

            Reason = reason;
            UpdatedAt = DateTime.UtcNow;
            State = ExamRequestState.Rejected;
        }

    }
}
