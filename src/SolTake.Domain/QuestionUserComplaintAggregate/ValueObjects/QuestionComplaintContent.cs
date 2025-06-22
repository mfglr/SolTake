using SolTake.Domain.QuestionUserComplaintAggregate.Exceptions;

namespace SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects
{
    public class QuestionComplaintContent
    {
        public readonly static int MaxLength = 1024;
        public readonly static int MinLength = 2;
        public string Value { get; private set; }

        public QuestionComplaintContent(string value)
        {
            if (value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidQuestionComplaintContentException();
            Value = value;
        }
    }
}
