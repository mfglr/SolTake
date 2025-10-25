using SolTake.Core.Media;
using SolTake.QuestionService.Domain.Exceptions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionContent
    {
        public readonly static int MaxSoluiontContentLength = 1024;
        public string Value { get; private set; }
        public IEnumerable<NsfwScore> Scores { get; private set; }

        private QuestionContent(string value, IEnumerable<NsfwScore> scores)
        {
            Value = value;
            Scores = scores;
        }

        public QuestionContent(string value)
        {
            if (string.IsNullOrEmpty(value) || value.Length > MaxSoluiontContentLength)
                throw new QuestionContentLengthExceededException();
            Value = value;
            Scores = [];
        }

        public QuestionContent SetNsfwScores(IEnumerable<NsfwScore> Scores) => new(Value, Scores);
    }
}
