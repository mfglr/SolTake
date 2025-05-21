using SolTake.Core;

namespace SolTake.Domain.TopicAggregate.Entities
{
    public class Topic(string name) : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string Name { get; private set; } = name;
    }
}
