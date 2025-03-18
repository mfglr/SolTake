using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.SetMessageConnectionStateAsTyping
{
    public record SetMessageConnectionStateAsTypingDto(int TypingId) : IRequest;
}
