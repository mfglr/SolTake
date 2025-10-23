using SolTake.QuestionService.Domain.Exceptions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionTopic
    {
        public string Value { get; private set; }
        public QuestionTopic(string value)
        {
            if (string.IsNullOrEmpty(value) || value.Length < 3 || value.Length > 5096)
                throw new QuestionTopicException();
            Value = value;
        }
    }
}
