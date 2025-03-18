using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageDomain
{
    public class MessageResponseDto(int id, DateTime createdAt, DateTime? updatedAt, bool isOwner, string userName, int conversationId, int senderId, int receiverId, bool isEdited, string? content, MessageState state, IEnumerable<MessageMultimediaResponseDto> medias, Multimedia? multimedia)
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
        public MessageState state { get; private set; } = state;
        public IEnumerable<MessageMultimediaResponseDto> Medias { get; private set; } = medias;
        public Multimedia? Multimedia { get; private set; } = multimedia;

        public static MessageResponseDto Create(MessageCreatedDomainEvent @event)
            =>
                new(
                    @event.Message.Id,
                    @event.Message.CreatedAt,
                    @event.Message.UpdatedAt,
                    false,
                    @event.UserName,
                    @event.Message.SenderId,
                    @event.Message.SenderId,
                    @event.Message.ReceiverId,
                    false,
                    @event.Message.Content?.Value,
                    MessageState.Created,
                    @event.Message.Medias.Select(
                        (e) =>
                            new MessageMultimediaResponseDto(
                                e.ContainerName,
                                e.BlobName,
                                e.BlobNameOfFrame,
                                e.Size,
                                e.Height,
                                e.Width,
                                e.Duration,
                                e.MultimediaType
                            )
                    ),
                    @event.Image
                );

    }
}
