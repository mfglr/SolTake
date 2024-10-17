using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class Comment : Entity, IAggregateRoot
    {
        private Comment() { }

        public int AppUserId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        public int? ParentId { get; private set; }
        public int? RepliedId { get; private set; }
        public bool IsEdited { get; private set; }
        public CommentContent Content { get; private set; } = null!;
        public readonly List<CommentUserTag> _tags = [];
        public IReadOnlyCollection<CommentUserTag> Tags => _tags;

        public Comment(int userId,CommentContent content,IEnumerable<int> idsOfUsersTagged)
        {
            AppUserId = userId;
            Content = content;
            _tags.AddRange(idsOfUsersTagged.Select(CommentUserTag.Create));
        }

        internal void CreateQuestionComment(int questionId)
        {
            QuestionId = questionId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void CreateSolutionComment(int solutionId)
        {
            SolutionId = solutionId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void CreateReplyComment(int parentId,int repliedId)
        {
            ParentId = parentId;
            RepliedId = repliedId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }

        public void Update(CommentContent content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        public void SetRepliedIdNull() => RepliedId = null;

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
        public void DeleteLike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if(index == -1) return;
            _likes.RemoveAt(index);
        }
    }
}
