using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class Comment : IPaginableAggregateRoot, IDomainEventsContainer
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
       
        public bool IsEdited { get; private set; }
        public CommentContent Content { get; private set; } = null!;

        private void Create(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            AppUserId = appUserId;
            Content = content;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
            _tags.AddRange(idsOfUsersTagged.Select(x => CommentUserTag.Create(Id, x)));

            foreach (var id in idsOfUsersTagged)
                if (id != appUserId)
                    AddDomainEvent(new UserTaggedInCommentDomainEvent(this, id));
        }

        internal void CreateQuestionComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int questionId)
        {
            Create(appUserId,content,idsOfUsersTagged);
            QuestionId = questionId;
        }
        internal void CreateSolutionComment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged, int solutionId)
        {
            Create(appUserId, content, idsOfUsersTagged);
            SolutionId = solutionId;
        }
        internal void CreateReplyComment(int appUserId,CommentContent content,IEnumerable<int> idsOfUsersTagged,int parentId,int repliedId)
        {
            Create(appUserId, content, idsOfUsersTagged);
            ParentId = parentId;
            RepliedId = repliedId;
        }

        public void Update(CommentContent content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        public void Delete()
        {
            foreach (var child in _children)
            {
                child._likes.Clear();
                child._tags.Clear();
                child._replies.Clear();
            }
            _likes.Clear();
            _tags.Clear();
            _replies.Clear();
            _children.Clear();
        }

        public int? RepliedId { get; private set; }
        public Comment? Replied { get; }
        private readonly List<Comment> _replies = [];
        public IReadOnlyCollection<Comment> Replies => _replies;

        public int? ParentId { get; private set; }
        public Comment? Parent { get; }
        private readonly List<Comment> _children = [];
        public IReadOnlyCollection<Comment> Children => _children;

        private readonly List<CommentUserLike> _likes = [];
        public IReadOnlyCollection<CommentUserLike> Likes => _likes;
        public void Like(int likerId)
        {
            if (_likes.Any(x => x.AppUserId == likerId))
                throw new CommentIsAlreadyLikedException();
            _likes.Add(CommentUserLike.Create(Id, likerId));

            if (likerId != AppUserId)
                AddDomainEvent(new CommentLikedDomainEvent(this, likerId));
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1)
                throw new NoCommentLikeException();
            _likes.RemoveAt(index);
        }

        public readonly List<CommentUserTag> _tags = [];
        public IReadOnlyCollection<CommentUserTag> Tags => _tags;

        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();

        //readonly navigators
        public AppUser AppUser { get; } = null!;
        public Question? Question { get; }
        public Solution? Solution { get; }
        public IReadOnlyCollection<Notification> Notifications { get; } = null!;
    }
}
