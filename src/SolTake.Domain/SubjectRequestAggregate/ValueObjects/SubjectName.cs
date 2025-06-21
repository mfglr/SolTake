using SolTake.Domain.SubjectRequestAggregate.Exceptions;

namespace SolTake.Domain.SubjectRequestAggregate.ValueObjects
{
    public class SubjectName
    {
        public readonly static int MinLength = 1;
        public readonly static int MaxLength = 64;

        public string Value { get; set; }

        public SubjectName(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidSubjectRequestNameException();
            Value = value;
        }
    }
}
