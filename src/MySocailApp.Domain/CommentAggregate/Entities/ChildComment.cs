using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public abstract class ChildComment : Comment
    {
        protected ChildComment() { }

        public ChildComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int parentId) : base(appUserId,content,idsOfUsersTagged)
        {
            ParentId = parentId;
        }

        public int ParentId { get; private set; }
        public void Reply(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            var reply = new Reply(appUserId, content, idsOfUsersTagged, ParentId, Id);
            _replies.Add(reply);
        }
    }
}
