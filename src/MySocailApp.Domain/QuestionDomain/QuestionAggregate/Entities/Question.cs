using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
{
    public class Question : Entity, IAggregateRoot
    {
        private Question() { }
        public readonly static int MaxTopicCountPerQuestion = 3;
        public readonly static int MaxMediaCountPerQuestion = 3;

        public int UserId { get; private set; }
        public QuestionExam Exam { get; private set; } = null!;
        public QuestionSubject Subject { get; private set; } = null!;
        public QuestionTopic? Topic { get; private set; }
        public QuestionContent? Content { get; private set; }
        private readonly List<QuestionMultimedia> _medias = [];
        public IReadOnlyList<QuestionMultimedia> Medias => _medias;

        public Question(int userId, QuestionContent? content, IEnumerable<QuestionMultimedia> medias)
        {
            if (!medias.Any() && content == null)
                throw new QuesitonContentRequiredException();

            if (medias.Count() > MaxMediaCountPerQuestion)
                throw new TooManyQuestionMediasException();

            UserId = userId;
            Content = content;
            _medias.AddRange(medias);
        }

        internal void Create(QuestionExam exam, QuestionSubject subject, QuestionTopic? topic)
        {
            Exam = exam;
            Subject = subject;
            Topic = topic;
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionCreatedDomainEvent(this));
        }

        //likes
        private readonly List<QuestionUserLike> _likes = [];
        public IReadOnlyList<QuestionUserLike> Likes => _likes;
        private readonly List<QuestionUserLikeNotification> _likeNotifications = [];
        public IReadOnlyList<QuestionUserLikeNotification> LikeNotifications => _likeNotifications;
        public QuestionUserLike Like(int likerId)
        {
            if (_likes.Any(x => x.AppUserId == likerId))
                throw new QuestionWasAlreadyLikedException();

            var like = QuestionUserLike.Create(likerId);
            _likes.Add(like);
            if (likerId != UserId && !_likeNotifications.Any(x => x.AppUserId == likerId))
            {
                _likeNotifications.Add(new QuestionUserLikeNotification(likerId));
                AddDomainEvent(new QuestionLikedDomainEvent(this, like));
            }
            return like;
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1) return;
            _likes.RemoveAt(index);
            AddDomainEvent(new QuestionDislikedDomainEvent(this));
        }
        public void DeleteLike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1) return;
            _likes.RemoveAt(index);
        }

        //saving questions
        private readonly List<QuestionUserSave> _savers = [];
        public IReadOnlyList<QuestionUserSave> Savers => _savers;
        public QuestionUserSave Save(int appUserId)
        {
            if (_savers.Any(x => x.AppUserId == appUserId))
                throw new QuestionAlreadySavedException();
            var save = QuestionUserSave.Create(appUserId);
            _savers.Add(save);
            return save;
        }
        public void Unsave(int appUserId)
        {
            var save = _savers.FirstOrDefault(x => x.AppUserId == appUserId) ?? throw new QuestionNotSavedException();
            _savers.Remove(save);
        }
        public void DeleteSave(int appUserId)
        {
            var index = _savers.FindIndex(x => x.AppUserId == appUserId);
            if (index == -1) return;
            _savers.RemoveAt(index);
        }
    }
}
