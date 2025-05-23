using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserUserBlockAggregate.Delete
{
    public record DeleteUserUserBlockDto(int BlockedId) : IRequest;
}
