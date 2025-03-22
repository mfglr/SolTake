using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.DomainEvents;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageDomain
{
    public class MessageConnectionResponseDto(int id, MessageConnectionState state, int? typingId)
    {
        public int Id { get; private set; } = id;
        public MessageConnectionState State { get; private set; } = state;
        public int? TypingId { get; private set; } = typingId;

        public static MessageConnectionResponseDto Create(MessageConnection messageConnection)
            => 
                new(
                    messageConnection.Id,
                    messageConnection.State,
                    messageConnection.TypingId
                );

    }
}
