using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.CreateUser
{
    public record CreateUserDto(string Email, string Password, string PasswordConfirm) : IRequest<LoginDto>;
}
