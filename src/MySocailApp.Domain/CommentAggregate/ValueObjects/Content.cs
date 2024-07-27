using MySocailApp.Domain.CommentAggregate.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.ValueObjects
{
    public class Content
    {
        public string Value { get; private set; }

        public Content(string value)
        {
            if (string.IsNullOrEmpty(value))
                throw new ContentIsEmptyException();
            if (value.Length > 2200)
                throw new ContentToLongException();

            Value = value;
        }
    }
}
