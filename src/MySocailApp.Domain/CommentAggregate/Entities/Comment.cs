using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Exceptions;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Domain.CommentAggregate.Entities
{
    public class Comment : IAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        public int? ParentId { get; private set; }
        public bool IsEdited { get; private set; }
        public Content Content { get; private set; } = null!;

        private void Create(int appUserId, Content content, IEnumerable<int> idsOfUsersTagged)
        {
            _tags.AddRange(idsOfUsersTagged.Select(x => CommentUserTag.Create(Id, x)));
            IsEdited = false;
            AppUserId = appUserId;
            Content = content;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void CreateQuestionComment(int appUserId, Content content, IEnumerable<int> idsOfUsersTagged, int questionId)
        {
            Create(appUserId,content,idsOfUsersTagged);
            QuestionId = questionId;
        }
        internal void CreateSolutionComment(int appUserId, Content content, IEnumerable<int> idsOfUsersTagged, int solutionId)
        {
            Create(appUserId, content, idsOfUsersTagged);
            SolutionId = solutionId;
        }
        internal void CreateReply(int appUserId, Content content, IEnumerable<int> idsOfUsersTagged, int parentId)
        {
            Create(appUserId, content, idsOfUsersTagged);
            ParentId = parentId;
        }

        public void Update(Content content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        private readonly List<CommentUserLike> _likes = [];
        public IReadOnlyCollection<CommentUserLike> Likes => _likes;
        public void Like(int userId)
        {
            if (_likes.Any(x => x.AppUserId == userId))
                throw new CommentIsAlreadyLikedException();
            _likes.Add(CommentUserLike.Create(Id, userId));
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

        //readonly navigators
        public Question? Question { get; }
        public Solution? Solution { get; }
        public Comment? Parent { get; }
        public IReadOnlyCollection<Comment> Children { get; }
        public Comment? Replied { get; }
        public AppUser AppUser { get; } = null!;
    }
}
