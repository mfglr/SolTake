using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainEvents;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities
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
    }
}
