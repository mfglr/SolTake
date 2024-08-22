using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public abstract class Comment : IPaginableAggregateRoot, IDomainEventsContainer
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public bool IsEdited { get; private set; }
        public CommentContent Content { get; private set; } = null!;

        protected Comment() { }

        public Comment(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            AppUserId = appUserId;
            Content = content;
            _tags.AddRange(idsOfUsersTagged.Select(x => CommentUserTag.Create(Id, x)));

            foreach (var id in idsOfUsersTagged)
                if (id != appUserId)
                    AddDomainEvent(new UserTaggedInCommentDomainEvent(this, id));
        }
        internal virtual void Create() => UpdatedAt = CreatedAt = DateTime.UtcNow;
        public void Update(CommentContent content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        protected readonly List<Reply> _replies = [];
        public IReadOnlyCollection<Reply> Replies => _replies;

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

        private readonly List<CommentUserTag> _tags = [];
        public IReadOnlyCollection<CommentUserTag> Tags => _tags;

        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();

        //readonly navigators
        public AppUser AppUser { get; } = null!;
        public IReadOnlyCollection<Notification> Notifications { get; } = null!;
    }
}
