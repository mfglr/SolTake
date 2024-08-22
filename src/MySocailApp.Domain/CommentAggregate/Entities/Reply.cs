using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class Reply : ChildComment
    {
        public Reply(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int parentId, int repliedId) : base(appUserId, content, idsOfUsersTagged, parentId)
        {
            RepliedId = repliedId;
        }

        protected Reply() { }

        public int RepliedId { get; private set; }
    }
}
