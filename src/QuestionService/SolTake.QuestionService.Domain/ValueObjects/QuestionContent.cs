using SolTake.QuestionService.Domain.Exceptions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionContent
    {
        public readonly static int MaxSoluiontContentLength = 1024;
        public string Value { private set; get; }

        public QuestionContent(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            if (value.Length > MaxSoluiontContentLength)
                throw new QuestionContentLengthExceededException();
            Value = value;
        }
    }
}
