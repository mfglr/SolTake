namespace SolTake.QuestionService.Domain.ValueObjects
{
    public enum QuestionSubjectState
    {
        Pending,
        Valid,
        Invalid
    }

    public enum QuestionSubjectInvalidReason
    {
        NotFound,
        NotBelong
    }

    public class QuestionSubject
    {
        public Guid Id { get; private set; }
        public QuestionSubjectState State { get; private set; }
        public IEnumerable<QuestionSubjectInvalidReason> Reasons { get; private set; }
        private QuestionSubject(Guid id, QuestionSubjectState state, IEnumerable<QuestionSubjectInvalidReason> reasons)
        {
            Id = id;
            State = state;
            Reasons = reasons;
        }

        public QuestionSubject(Guid id)
        {
            Id = id;
            State = QuestionSubjectState.Pending;
            Reasons = [];
        }

        public QuestionSubject MarkAsValid() => new(Id, QuestionSubjectState.Valid, Reasons);
        public QuestionSubject MarkAsInvalid(QuestionSubjectInvalidReason reason) => new(Id, QuestionSubjectState.Invalid, [..Reasons, reason]);
    }
}
