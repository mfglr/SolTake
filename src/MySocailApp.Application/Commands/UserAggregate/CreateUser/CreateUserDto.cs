using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.CreateUser
{
    public record CreateUserDto(string Email, string Password, string PasswordConfirm) : IRequest<LoginDto>;
}
