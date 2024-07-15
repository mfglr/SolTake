namespace MySocailApp.Application.Queries.TopicAggregate
{
    public class TopicResponseDto
    {
        public int Id { get; private set; }
        public int SubjectId { get; private set; }
        public string Name { get; private set; }

        private TopicResponseDto() { }
    }
}
