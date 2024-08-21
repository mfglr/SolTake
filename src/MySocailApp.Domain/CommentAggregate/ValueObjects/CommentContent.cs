using MySocailApp.Domain.CommentAggregate.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.ValueObjects
{
    public class CommentContent
    {
        public string Value { get; private set; }

        public CommentContent(string value)
        {
            if (string.IsNullOrEmpty(value))
                throw new ContentIsEmptyException();
            if (value.Length > 2200)
                throw new ContentToLongException();

            Value = value;
        }
    }
}
