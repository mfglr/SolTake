namespace MySocailApp.Application.Queries.MessageAggregate
{
    public class MessageResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public int OwnerId { get; private set; }
        public bool IsEdited { get; private set; }
        public int ConversationId { get; private set; }
        public string? Content { get; private set; }
        public int State { get; private set; }
        public IReadOnlyCollection<MessageImageResponseDto> Images { get; private set; }

        private MessageResponseDto() { }
    }
}
