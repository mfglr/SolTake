namespace MySocailApp.Application.Queries.ConversationContenxt.MessageAggregate
{
    public class MessageResponseDto
    {
        public int Id { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public bool IsEdited { get; private set; }
        public int SenderId { get; private set; }
        public int ReceiverId { get; private set; }
        public string? Content { get; private set; }
        public int State { get; private set; }
        public DateTime? ReceiptedAt { get; private set; }
        public DateTime? ViewedAt { get; private set; }
        public IReadOnlyCollection<MessageImageResponseDto> Images { get; private set; }

        private MessageResponseDto() { }
    }
}
