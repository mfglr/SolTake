using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.ExamAggregate.Entitities;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.Entities
{
    public class Question() : IPaginableAggregateRoot, IDomainEventsContainer
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime? UpdatedAt { get; private set; }
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public int AppUserId { get; private set; }
        public string? Content { get; private set; }
        public QuestionState State { get; private set; }

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
            _topics.AddRange(topics.Select(topicId => QuestionTopic.Create(Id, topicId)));
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
            State = QuestionState.NotSolved;
            CreatedAt = DateTime.UtcNow;
            _topics.AddRange(topics.Select(topicId => QuestionTopic.Create(Id, topicId)));
            _images.AddRange(images);
        }
        public void MarkAsSolved()
        {
            State = QuestionState.Solved;
            UpdatedAt = DateTime.UtcNow;
        }

        private readonly List<QuestionUserLike> _likes = [];
        public IReadOnlyList<QuestionUserLike> Likes => _likes;
        public void Like(int likerId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == likerId);
            if (index != -1)
                throw new QuestionWasAlreadyLikedException();
            _likes.Add(QuestionUserLike.Create(Id, likerId));
            
            if(likerId != AppUserId)
                AddDomainEvent(new QuestionLikedDomainEvent(this, likerId));
        }
        public void Dislike(int userId)
        {
            var index = _likes.FindIndex(x => x.AppUserId == userId);
            if (index == -1)
                throw new NoQuestionLikeException();
            _likes.RemoveAt(index);
        }

        public Exam Exam { get; } = null!;
        public Subject Subject { get; } = null!;
        public AppUser AppUser { get; } = null!;
        public IReadOnlyList<Solution> Solutions { get; } = null!;
        public IReadOnlyCollection<Comment> Comments { get; } = null!;


        //IDomainEventsContainer
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
        public void ClearEvents() => _events.Clear();
    }
}
