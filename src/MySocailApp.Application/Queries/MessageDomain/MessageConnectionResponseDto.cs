using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageDomain
{
    public record MessageConnectionResponseDto(int Id, MessageConnectionState State, int? TypingId);
}
