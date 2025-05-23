using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.DeleteUser
{
    public record DeleteUserDto() : IRequest;
}
