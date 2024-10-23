using MySocailApp.Domain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageAggregate.ValueObjects
{
    public class MessageContent
    {
        public readonly static int MaxLength = 2200;

        public string Value { get; private set; }

        public MessageContent(string value)
        {
            if (string.IsNullOrEmpty(value))
                throw new MessageContentRequiredException();

            if (value.Length > MaxLength)
                throw new MessageContentLengthExceedException();

            Value = value;
        }
    }
}
