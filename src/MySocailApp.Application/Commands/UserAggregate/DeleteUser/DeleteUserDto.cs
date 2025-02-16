using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.DeleteUser
{
    public record DeleteUserDto() : IRequest;
}
