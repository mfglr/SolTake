using SolTake.Domain.UserAggregate.Entities;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.Entities;
using SolTake.Domain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageDomain.MessageAggregate.CreateMessage
{
    public class CreateMessageResponseDto(Message message, User receiver)
    {
        public int Id { get; private set; } = message.Id;
        public DateTime CreatedAt { get; private set; } = message.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = message.UpdatedAt;
        public bool IsOwner { get; private set; } = true;
        public string UserName { get; private set; } = receiver.UserName.Value;
        public int ConversationId { get; private set; } = message.ReceiverId;
        public int SenderId { get; private set; } = message.SenderId;
        public int ReceiverId { get; private set; } = message.ReceiverId;
        public bool IsEdited { get; private set; } = false;
        public string? Content { get; private set; } = message.Content?.Value;
        public MessageState State { get; private set; } = MessageState.Created;
        public IEnumerable<Multimedia> Medias { get; private set; } = message.Medias;
        public Multimedia? Image { get; private set; } = receiver.Image;
    }
}
