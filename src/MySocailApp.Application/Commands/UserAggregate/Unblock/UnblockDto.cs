using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.Unblock
{
    public record UnblockDto(int UserId) : IRequest;
}
