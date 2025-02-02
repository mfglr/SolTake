using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionContent
    {
        public readonly static int MaxSoluiontContentLength = 500;
        public string Value { get; private set; }

        public SolutionContent(string value)
        {
            ArgumentNullException.ThrowIfNull(value);
            //if (value.Length > MaxSoluiontContentLength)
            //    throw new SolutionContentLengthExceededException();
            Value = value;
        }
    }
}
