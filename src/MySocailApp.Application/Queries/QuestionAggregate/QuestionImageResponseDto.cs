namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionImageResponseDto
    {
        public int Id { get; private set; }
        public string BlobName { get; private set; }
        public DateTime CreatedAt { get; private set; }

        private QuestionImageResponseDto() { }
    }
}
