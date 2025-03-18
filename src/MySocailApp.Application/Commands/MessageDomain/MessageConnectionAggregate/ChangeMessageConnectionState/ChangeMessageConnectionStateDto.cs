using MediatR;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionState
{
    public record ChangeMessageConnectionStateDto(MessageConnectionState State, int? TypingId) : IRequest;
}
