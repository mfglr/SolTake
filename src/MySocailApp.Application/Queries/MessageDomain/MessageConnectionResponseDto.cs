using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageDomain
{
    public class MessageConnectionResponseDto(int id, DateTime? updatedAt, string userName, Multimedia? image, MessageConnectionState state, int? typingId)
    {
        public int Id { get; private set; } = id;
        public DateTime? UpdatedAt { get; private set; } = updatedAt;
        public string UserName { get; private set; } = userName;
        public Multimedia? Image { get; private set; } = image;
        public MessageConnectionState State { get; private set; } = state;
        public int? TypingId { get; private set; } = typingId;


        public static MessageConnectionResponseDto Create(MessageConnectionStateChangedDomainEvent @event) =>
            new(
                @event.MessageConnection.Id,
                @event.MessageConnection.UpdatedAt,
                @event.UserName,
                @event.Image,
                @event.MessageConnection.State,
                @event.MessageConnection.TypingId
            );

    }
}
