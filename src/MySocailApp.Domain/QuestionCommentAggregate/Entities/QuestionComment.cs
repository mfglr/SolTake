using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionCommentAggregate.Exceptions;
using MySocailApp.Domain.QuestionCommentAggregate.ValueObjects;

namespace MySocailApp.Domain.QuestionCommentAggregate.Entities
{
    public class QuestionComment : IAggregateRoot
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int AppUserId { get; private set; }
        public int QuestionId { get; private set; }
        public bool IsEdited { get; private set; }
        public Content Content { get; private set; }

        public void Create(int appUserId, int questionId, Content content)
        {
            Content = content;
            IsEdited = false;
            AppUserId = appUserId;
            QuestionId = questionId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }

        public void Update(Content content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        private readonly List<QuestionCommentUserLike> _likes = [];
        public IReadOnlyCollection<QuestionCommentUserLike> Likes => _likes;
        public void Like(int userId)
        {
            if (_likes.Any(x => x.AppUserId == userId))
                throw new QuestionCommentIsAlreadyLikedException();
            _likes.Add(QuestionCommentUserLike.Create(Id, userId));
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1)
                throw new NoQuestionCommentLikeException();
            _likes.RemoveAt(index);
        }

        //readonly navigators
        public Question Question { get; }
        public AppUser AppUser { get; }
    }
}
