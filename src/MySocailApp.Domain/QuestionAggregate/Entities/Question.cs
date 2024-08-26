using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class Question() : Entity, IAggregateRoot
    {
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }

        private readonly List<QuestionImage> _images = [];
        public IReadOnlyCollection<QuestionImage> Images => _images;
        public bool HasBlobName(string blobName) => _images.Any(x => x.BlobName == blobName);

        private readonly List<QuestionTopic> _topics = [];
        public IReadOnlyCollection<QuestionTopic> Topics => _topics;
        internal void AddNewTopics(IEnumerable<int> topics)
        {
            if (topics.Count() > 3)
                throw new TooManyTopicsException();
            _topics.Clear();
            _topics.AddRange(topics.Select(topicId => QuestionTopic.Create(topicId)));
        }

        internal void Create(int appUserId, string? content, int examId, int subjectId, IEnumerable<int> topics, IEnumerable<QuestionImage> images)
        {
            if (topics.Count() > 3)
                throw new TooManyTopicsException();
            if (!images.Any())
                throw new QuestionImageIsRequiredException();
            if (images.Count() > 5)
                throw new TooManyQuestionImagesException();

            AppUserId = appUserId;
            Content = content;
            ExamId = examId;
            SubjectId = subjectId;
            CreatedAt = DateTime.UtcNow;
            _topics.AddRange(topics.Select(topicId => QuestionTopic.Create(topicId)));
            _images.AddRange(images);
        }

        private readonly List<QuestionUserLike> _likes = [];
        public IReadOnlyList<QuestionUserLike> Likes => _likes;
        public void Like(int likerId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == likerId);
            if (index != -1) return;

            _likes.Add(QuestionUserLike.Create(likerId));
            if(likerId != AppUserId)
                AddDomainEvent(new QuestionLikedDomainEvent(this, likerId));
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1) return;

            _likes.RemoveAt(index);
        }

        // Readonly navigator properties
        public Exam Exam { get; } = null!;
        public Subject Subject { get; } = null!;
        public AppUser AppUser { get; } = null!;
        public IReadOnlyList<Solution> Solutions { get; } = null!;
        public IReadOnlyCollection<Comment> Comments { get; } = null!;
    }
}
