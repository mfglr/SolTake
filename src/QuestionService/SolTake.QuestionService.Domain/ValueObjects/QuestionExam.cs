namespace SolTake.QuestionService.Domain.ValueObjects
{
    public enum QuestionExamState
    {
        Pending,
        Valid,
        Invalid
    }

    public class QuestionExam
    {
        public Guid Id { get; private set; }
        public QuestionExamState State { get; private set; }

        private QuestionExam(Guid id, QuestionExamState state)
        {
            Id = id;
            State = state;
        }

        public QuestionExam(Guid id)
        {
            Id = id;
            State = QuestionExamState.Pending;
        }

        public QuestionExam MarkedAsValid() => new(Id, QuestionExamState.Valid);
        public QuestionExam MarkedAsInvalid() => new(Id, QuestionExamState.Invalid);

        public static bool operator ==(QuestionExam x, QuestionExam y) => x.Id == y.Id && x.State == y.State;
        public static bool operator !=(QuestionExam x, QuestionExam y) => x.Id != y.Id && x.State == y.State;
    }
}
