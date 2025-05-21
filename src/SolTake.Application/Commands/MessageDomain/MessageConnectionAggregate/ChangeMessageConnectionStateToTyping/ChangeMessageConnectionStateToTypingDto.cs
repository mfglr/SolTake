using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToTyping
{
    public record ChangeMessageConnectionStateToTypingDto(int UserId) : IRequest;
}
