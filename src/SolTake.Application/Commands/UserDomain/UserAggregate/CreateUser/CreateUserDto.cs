using MediatR;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.CreateUser
{
    public record CreateUserDto(string Email, string Password, string PasswordConfirm) : IRequest<LoginDto>;
}
