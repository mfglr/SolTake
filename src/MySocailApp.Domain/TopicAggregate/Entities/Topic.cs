using MySocailApp.Core;

namespace MySocailApp.Domain.TopicAggregate.Entities
{
    public class Topic(string name) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string Name { get; private set; } = name;
    }
}
