using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Delete
{
    public record DeleteUserUserBlockDto(int BlockedId) : IRequest;
}
