using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.Unblock
{
    public record UnblockDto(int BlockedId) : IRequest;
}
