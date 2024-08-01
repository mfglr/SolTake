namespace MySocailApp.Application.Queries.MessageAggregate
{
    public class MessageImageResponseDto
    {
        public int Id { get; private set; }
        public int MessageId { get; private set; }
        public string BlobName { get; private set; } = null!;
        public int Height { get; private set; }
        public int Width { get; private set; }

        private MessageImageResponseDto() { }
    }
}
