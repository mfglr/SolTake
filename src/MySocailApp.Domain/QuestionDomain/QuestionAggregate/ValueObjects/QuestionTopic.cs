namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects
{
    public class QuestionTopic(int id, string name)
    {
        public int Id { get; private set; } = id;
        public string Name { get; private set; } = name;
    }
}
