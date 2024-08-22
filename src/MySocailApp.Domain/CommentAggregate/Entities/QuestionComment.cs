using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class QuestionComment : ParentComment
    {
        public QuestionComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int questionId) : base(appUserId, content, idsOfUsersTagged)
        {
            QuestionId = questionId;
        }
        protected QuestionComment() { }

        public int QuestionId { get; private set; }

        internal override void Create()
        {
            base.Create();
            AddDomainEvent(new QuestionCommentCreatedDomainEvent(this));
        }

        //readonly navigator properties
        public Question Question { get; } = null!;

        
    }
}
