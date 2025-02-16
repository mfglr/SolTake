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

        //saving questions
        private readonly List<QuestionUserSave> _savers = [];
        public IReadOnlyList<QuestionUserSave> Savers => _savers;
        public QuestionUserSave Save(int userId)
        {
            if (_savers.Any(x => x.UserId == userId))
                throw new QuestionAlreadySavedException();
            var save = QuestionUserSave.Create(userId);
            _savers.Add(save);
            return save;
        }
        public void Unsave(int userId)
        {
            var save = _savers.FirstOrDefault(x => x.UserId == userId) ?? throw new QuestionNotSavedException();
            _savers.Remove(save);
        }
        public void DeleteSave(int userId)
        {
            var index = _savers.FindIndex(x => x.UserId == userId);
            if (index == -1) return;
            _savers.RemoveAt(index);
        }
    }
}
