using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.SetMessageConnectionStateAsWriting
{
    public record SetMessageConnectionStateAsWritingDto(int TypingId) : IRequest;
}
