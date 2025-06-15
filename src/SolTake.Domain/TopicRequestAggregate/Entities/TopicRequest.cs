using SolTake.Core;
using SolTake.Domain.TopicRequestAggregate.Exceptions;
using SolTake.Domain.TopicRequestAggregate.ValueObjects;

namespace SolTake.Domain.TopicRequestAggregate.Entities
{
    public class TopicRequest : Entity, IAggregateRoot
    {
        public static readonly int MaxLength = 255;

        public int SubjectId { get; private set; }
        public int UserId { get; private set; }
        public string Name { get; private set; }
        public TopicRequestState State { get; private set; }
        public RejectionReason? RejectionReason { get; private set; }

        public TopicRequest(int subjectId, int userId, string name)
        {
            if (name.Length > MaxLength)
                throw new TopicRequestNameLengthExceededException();

            SubjectId = subjectId;
            UserId = userId;
            Name = name;
        }

        public void Create()
        {
            CreatedAt = DateTime.UtcNow;
            State = TopicRequestState.Pending;
        }

        public void Approve()
        {
            if (State != TopicRequestState.Pending)
                throw new InvalidTopicRequestStateTranstion();
            State = TopicRequestState.Approved;
            UpdatedAt = DateTime.UtcNow;
        }

        public void Reject(RejectionReason reason)
        {
            if (State != TopicRequestState.Pending)
                throw new InvalidTopicRequestStateTranstion();
            State = TopicRequestState.Rejected;
            RejectionReason = reason;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
