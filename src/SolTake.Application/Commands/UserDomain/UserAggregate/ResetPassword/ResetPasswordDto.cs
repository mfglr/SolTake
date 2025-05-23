using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.ResetPassword
{
    public record ResetPasswordDto(string Email, string Token, string Password, string PasswordConfirm) : IRequest;
}
