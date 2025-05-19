using MySocailApp.Domain.QuestionAggregate.Exceptions;

namespace MySocailApp.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionContent
    {
        public readonly static int MaxSoluiontContentLength = 1000;
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
