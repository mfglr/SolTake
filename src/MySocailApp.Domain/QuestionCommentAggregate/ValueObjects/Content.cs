using MySocailApp.Domain.QuestionCommentAggregate.Exceptions;

namespace MySocailApp.Domain.QuestionCommentAggregate.ValueObjects
{
    public class Content
    {
        public string Value { get; private set; }

        public Content(string value)
        {
            if (string.IsNullOrEmpty(value))
                throw new ContentIsEmptyException();
            if(value.Length > 2200)
                throw new ContentToLongException();

            Value = value;
        }
    }
}
