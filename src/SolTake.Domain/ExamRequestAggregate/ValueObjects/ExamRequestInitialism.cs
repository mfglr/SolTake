using SolTake.Domain.ExamRequestAggregate.Exceptions;

namespace SolTake.Domain.ExamRequestAggregate.ValueObjects
{
    public class ExamRequestInitialism
    {
        public static readonly int MinLength = 1;
        public static readonly int MaxLength = 50;

        public string Value { get; private set; }

        public ExamRequestInitialism(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidExamRequestInitialismException();
            Value = value.Trim().ToUpper();
        }
    }
}
