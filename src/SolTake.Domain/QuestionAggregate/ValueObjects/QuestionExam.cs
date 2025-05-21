namespace SolTake.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionExam(int id, string shortName, string fullName)
    {
        public int Id { get; private set; } = id;
        public string ShortName { get; private set; } = shortName;
        public string FullName { get; private set; } = fullName;

    }
}
