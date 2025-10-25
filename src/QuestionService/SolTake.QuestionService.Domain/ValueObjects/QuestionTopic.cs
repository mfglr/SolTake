using SolTake.Core.Media;
using SolTake.QuestionService.Domain.Exceptions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionTopic
    {
        public string Value { get; private set; }
        public IEnumerable<NsfwScore> Scores { get; private set; }
        
        public QuestionTopic(string value)
        {
            if (string.IsNullOrEmpty(value) || value.Length < 3 || value.Length > 5096)
                throw new QuestionTopicException();
            Value = value;
            Scores = [];
        }

        private QuestionTopic(string value, IEnumerable<NsfwScore> scores)
        {
            Value = value;
            Scores = scores;
        }

        public QuestionTopic SetNsfwScore(IEnumerable<NsfwScore> scores) => new (Value,scores);

    }
}
