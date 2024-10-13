using MySocailApp.Core;

namespace MySocailApp.Domain.TopicAggregate.Entities
{
    public class Topic : Entity, IAggregateRoot
    {
        public string Name { get; private set; }
        private Topic(string name) => Name = name;
        public static Topic Create(string name) => new (name) { CreatedAt = DateTime.UtcNow };
    }
}
