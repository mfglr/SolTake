using SolTake.Core;
using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.ValueObjects;

namespace SolTake.Domain.QuestionAggregate.Entities
{
    public class Question : Entity, IAggregateRoot
    {
        private Question() { }
        public readonly static int MaxTopicCountPerQuestion = 3;
        public readonly static int MaxMediaCountPerQuestion = 5;

        public int UserId { get; private set; }
        public QuestionExam Exam { get; private set; } = null!;
        public QuestionSubject Subject { get; private set; } = null!;
        private readonly List<QuestionTopic> _topics = [];
        public IReadOnlyList<QuestionTopic> Topics => _topics;
        public QuestionContent? Content { get; private set; }
        public QuestionPublishingState PublishingState { get; private set; }
        public DateTime? PublishingStateChagedAt { get; private set; }
        private readonly List<Multimedia> _medias = [];
        public IReadOnlyList<Multimedia> Medias => _medias;

        public Question(int userId, QuestionContent? content, IEnumerable<Multimedia> medias)
        {
            if (!medias.Any() && content == null)
                throw new QuesitonContentRequiredException();

            if (medias.Count() > MaxMediaCountPerQuestion)
                throw new TooManyQuestionMediasException();

            PublishingState = QuestionPublishingState.NotPublished;
            UserId = userId;
            Content = content;
            _medias.AddRange(medias);
        }

        internal void Create(QuestionExam exam, QuestionSubject subject, IEnumerable<QuestionTopic> topics)
        {
            Exam = exam;
            Subject = subject;
            _topics.AddRange(topics);
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionCreatedDomainEvent(this));
        }

        public void Publish()
        {
            if (PublishingState != QuestionPublishingState.NotPublished)
                throw new QuestionAlreadyPublishedOrRejectedException();

            PublishingState = QuestionPublishingState.Published;
            PublishingStateChagedAt = UpdatedAt = DateTime.UtcNow;
        }

        public void Reject()
        {
            if (PublishingState != QuestionPublishingState.NotPublished)
                throw new QuestionAlreadyPublishedOrRejectedException();

            PublishingState = QuestionPublishingState.Rejected;
            PublishingStateChagedAt = UpdatedAt = DateTime.UtcNow;
        }
    }
}
