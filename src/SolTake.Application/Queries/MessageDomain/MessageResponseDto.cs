using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;
using SolTake.Domain.MessageAggregate.ValueObjects;

namespace SolTake.Application.Queries.MessageDomain
{
    public class MessageResponseDto(int id, DateTime createdAt, DateTime? updatedAt, bool isOwner, string userName, int conversationId, int senderId, int receiverId, bool isEdited, string? content, MessageState state, IEnumerable<Multimedia> medias, Multimedia? multimedia)
    {
        public int Id { get; private set; } = id;
        public DateTime CreatedAt { get; private set; } = createdAt;
        public DateTime? UpdatedAt { get; private set; } = updatedAt;
        public bool IsOwner { get; private set; } = isOwner;
        public string UserName { get; private set; } = userName;
        public int ConversationId { get; private set; } = conversationId;
        public int SenderId { get; private set; } = senderId;
        public int ReceiverId { get; private set; } = receiverId;
        public bool IsEdited { get; private set; } = isEdited;
        public string? Content { get; private set; } = content;
        public MessageState State { get; private set; } = state;
        public IEnumerable<Multimedia> Medias { get; private set; } = medias;
        public Multimedia? Multimedia { get; private set; } = multimedia;

        public static MessageResponseDto Create(MessageCreatedDomainEvent @event)
            =>
                new(
                    @event.Message.Id,
                    @event.Message.CreatedAt,
                    @event.Message.UpdatedAt,
                    false,
                    @event.Login.UserName,
                    @event.Message.SenderId,
                    @event.Message.SenderId,
                    @event.Message.ReceiverId,
                    false,
                    @event.Message.Content?.Value,
                    MessageState.Created,
                    @event.Message.Medias,
                    @event.Login.Image
                );

    }
}
