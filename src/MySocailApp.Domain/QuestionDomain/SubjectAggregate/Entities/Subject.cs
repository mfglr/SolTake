using MySocailApp.Core;

namespace MySocailApp.Domain.QuestionDomain.SubjectAggregate.Entities
{
    public class Subject(int examId, string name) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public int ExamId { get; private set; } = examId;
        public string Name { get; private set; } = name;

        private readonly List<SubjectTopic> _topics = [];
        public IReadOnlyCollection<SubjectTopic> Topics => _topics;
        public void AddTopic(int topicId) => _topics.Add(new SubjectTopic(topicId));
    }
}
