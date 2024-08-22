using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public abstract class ParentComment : Comment
    {
        private readonly List<ChildComment> _children = [];

        public ParentComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged) : base(appUserId, content, idsOfUsersTagged){}

        protected ParentComment() { }

        public IReadOnlyCollection<ChildComment> Children => _children;

        public void Reply(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            var childComment = new Reply(appUserId, content, idsOfUsersTagged, Id, Id);
            _children.Add(childComment);
            _replies.Add(childComment);
        }
    }
}
