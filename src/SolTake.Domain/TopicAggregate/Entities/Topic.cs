using SolTake.Core;
using SolTake.Domain.TopicAggregate.Exceptions;

namespace SolTake.Domain.TopicAggregate.Entities
{
    public class Topic : Entity, IAggregateRoot
    {
        public readonly static int MaxLength = 256;
        public string Name { get; private set; }

        public Topic(string name)
        {
            if (name.Length > MaxLength)
                throw new TopicLengthExceededException();
            Name = name;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;
    }
}
