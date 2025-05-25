using SolTake.Domain.QuestionAggregate.DomainEvents;
using SolTake.Domain.QuestionAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using SolTake.Core;
using Newtonsoft.Json.Converters;

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
        public QuestionTopic? Topic { get; private set; }
        public QuestionContent? Content { get; private set; }
        public bool IsDraft { get; private set; }
        public DateTime? PublishedAt { get; private set; }
        private readonly List<Multimedia> _medias = [];
        public IReadOnlyList<Multimedia> Medias => _medias;

        public Question(int userId, QuestionContent? content, IEnumerable<Multimedia> medias)
        {
            if (!medias.Any() && content == null)
                throw new QuesitonContentRequiredException();

            if (medias.Count() > MaxMediaCountPerQuestion)
                throw new TooManyQuestionMediasException();

            IsDraft = true;
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

        public void Publish()
        {
            if (!IsDraft)
                throw new QuestionAlreadyPublishedException();

            IsDraft = false;
            PublishedAt = UpdatedAt = DateTime.UtcNow;
            AddDomainEvent(new QuestionPublishedDomainEvent(this));
        }
    }
}
