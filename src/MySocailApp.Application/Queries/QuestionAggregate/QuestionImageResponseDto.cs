namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public class QuestionImageResponseDto
    {
        public int Id { get; private set; }
        public int QuestionId { get; private set; }
        public string BlobName { get; private set; }
        public int Height { get; private set; }
        public int Width { get; private set; }

        private QuestionImageResponseDto() { }
    }
}
