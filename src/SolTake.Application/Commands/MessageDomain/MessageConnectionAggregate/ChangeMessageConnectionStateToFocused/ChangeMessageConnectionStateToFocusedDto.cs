using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused
{
    public record ChangeMessageConnectionStateToFocusedDto(int UserId) : IRequest;
}
