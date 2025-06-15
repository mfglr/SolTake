using SolTake.Domain.ExamAggregate.Exceptions;

namespace SolTake.Domain.ExamAggregate.ValueObjects
{
    public class ExamInitialism
    {
        public static readonly int MinLength = 1;
        public static readonly int MaxLength = 50;

        public string Value { get; private set; }

        public ExamInitialism(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidExamInitialismException();
            Value = value.ToUpper();
        }
    }
}
