using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Domain.UserAggregate.ValueObjects
{
    public class Biography
    {
        public static readonly int MaxNumberOfCharacters = 100;
        public string Value { get; private set; }

        public Biography(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            if (value.Length > MaxNumberOfCharacters)
                throw new BiographyLengthExceededException();
            Value = value;
        }
    }
}
