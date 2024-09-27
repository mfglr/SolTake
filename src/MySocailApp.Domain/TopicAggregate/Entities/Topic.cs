using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Domain.TopicAggregate.Entities
{
    public class Topic(string name) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string Name { get; private set; } = name;

        public IReadOnlyCollection<QuestionTopic> Questions { get; } = null!;
        public IReadOnlyCollection<SubjectTopic> Subjects { get; } = null!;
    }
}
