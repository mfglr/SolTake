using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToTyping
{
    public record ChangeMessageConnectionStateToTypingDto(int UserId) : IRequest;
}
