using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionContent
    {
        public readonly static int MaxSoluiontContentLength = 2200;
        public string Value { private set; get; }

        public QuestionContent(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            if (value.Length >= 2200)
                throw new QuestionContentLengthExceededException();
            Value = value;
        }
    }
}
