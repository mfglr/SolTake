namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class TopicResponseDto(int id, string name)
    {
        public int Id { get; private set; } = id;
        public string Name { get; private set; } = name;
    }
}
