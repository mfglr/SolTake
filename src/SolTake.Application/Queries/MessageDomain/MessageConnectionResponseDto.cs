using SolTake.Core;
using SolTake.Domain.MessageConnectionAggregate.DomainEvents;
using SolTake.Domain.MessageConnectionAggregate.ValueObjects;

namespace SolTake.Application.Queries.MessageDomain
{
    public class MessageConnectionResponseDto(int id, DateTime? lastSeenAt, string userName, Multimedia? image, MessageConnectionState state, int? userId)
    {
        public int Id { get; private set; } = id;
        public DateTime? LastSeenAt { get; private set; } = lastSeenAt;
        public string UserName { get; private set; } = userName;
        public Multimedia? Image { get; private set; } = image;
        public MessageConnectionState State { get; private set; } = state;
        public int? UserId { get; private set; } = userId;

        public static MessageConnectionResponseDto Create(MessageConnectionStateChangedDomainEvent @event) =>
            new(
                @event.MessageConnection.Id,
                @event.MessageConnection.LastSeenAt,
                @event.UserName,
                @event.Image,
                @event.MessageConnection.State,
                @event.MessageConnection.UserId
            );
    }
}
