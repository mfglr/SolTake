namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects
{
    public class QuestionSubject(int id, string name)
    {
        public int Id { get; private set; } = id;
        public string Name { get; private set; } = name;
    }
}
