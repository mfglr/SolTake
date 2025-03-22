using MediatR;

namespace MySocailApp.Application.Commands.MessageDomain.MessageConnectionAggregate.ChangeMessageConnectionStateToFocused
{
    public record ChangeMessageConnectionStateToFocusedDto(int UserId) : IRequest;
}
