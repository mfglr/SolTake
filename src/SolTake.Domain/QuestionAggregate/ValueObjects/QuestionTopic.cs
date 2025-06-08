using SolTake.Domain.QuestionAggregate.Exceptions;

namespace SolTake.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionTopic
    {
        public static readonly int MaxLength = 255;

        public string Name { get; private set; }

        public QuestionTopic(string name)
        {
            if (name.Length > MaxLength)
                throw new QuestionTopicLengthEceededException();
            Name = name;
        }
    }
}
