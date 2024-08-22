using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class SolutionComment : ParentComment
    {
        public SolutionComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int solutionId) : base(appUserId, content, idsOfUsersTagged)
        {
            SolutionId = solutionId;
        }

        protected SolutionComment() { }

        public int SolutionId { get; private set; }

        internal override void Create()
        {
            base.Create();
            AddDomainEvent(new SolutionCommentCreatedDomainEvent(this));
        }

        //readonly navigator properties;
        public Solution Solution { get; } = null!;

        
    }
}
