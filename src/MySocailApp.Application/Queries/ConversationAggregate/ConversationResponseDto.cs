using MySocailApp.Application.Queries.MessageAggregate;

namespace MySocailApp.Application.Queries.ConversationAggregate
{
    public class ConversationResponseDto
    {
        public int Id { get; private set; }
        public int UserId { get; private set; }
        public string UserName { get; private set; }
        public string? Name { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public DateTime UpdatedAt { get; private set; }
        public List<MessageResponseDto> Messages { get; private set; }

        private ConversationResponseDto() { }
    }
}
