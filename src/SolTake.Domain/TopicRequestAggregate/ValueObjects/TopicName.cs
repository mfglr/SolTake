using SolTake.Domain.TopicRequestAggregate.Exceptions;
using System.Xml.Linq;

namespace SolTake.Domain.TopicRequestAggregate.ValueObjects
{
    public class TopicName
    {
        public static readonly int MinLength = 3;
        public static readonly int MaxLength = 255;

        public string Value { get; private set; }

        public TopicName(string value)
        {
            if (value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidTopicRequestNameException();

            Value = value;
        }
    }
}
