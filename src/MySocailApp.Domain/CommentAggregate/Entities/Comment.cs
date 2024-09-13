using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class Comment : Entity, IAggregateRoot
    {
        public int AppUserId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        public readonly List<CommentUserTag> _tags = [];
        public IReadOnlyCollection<CommentUserTag> Tags => _tags;

        public bool IsEdited { get; private set; }
        public CommentContent Content { get; private set; } = null!;

        private void Create(int appUserId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            AppUserId = appUserId;
            Content = content;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
            _tags.AddRange(idsOfUsersTagged.Select(x => CommentUserTag.Create(Id, x)));
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
            foreach (var reply in _replies)
                reply.RepliedId = null;
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
        private readonly List<CommentLikeNotification> _likeNotifications = [];
        public IReadOnlyCollection<CommentLikeNotification> LikeNotifications => _likeNotifications;
        public CommentUserLike Like(int likerId)
        {
            if (_likes.Any(x => x.AppUserId == likerId))
                throw new CommentWasAlreadyLikedException();

            var like = CommentUserLike.Create(likerId);
            _likes.Add(like);
            if (likerId != AppUserId && !LikeNotifications.Any(x => x.AppUserId == likerId))
            {
                _likeNotifications.Add(new CommentLikeNotification(likerId));
                AddDomainEvent(new CommentLikedDomainEvent(this, like));
            }
            return like;
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1) return;
            _likes.RemoveAt(index);
            AddDomainEvent(new CommentDislikedDomainEvent(this));
        }

        //readonly navigators
        public AppUser AppUser { get; } = null!;
        public Question? Question { get; }
        public Solution? Solution { get; }
    }
}
