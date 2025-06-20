namespace SolTake.Domain.QuestionAggregate.ValueObjects
{
    public class QuestionExam(int id, string name, string initialism)
    {
        public int Id { get; private set; } = id;
        public string Name { get; private set; } = name;
        public string Initialism { get; private set; } = initialism;

    }
}
