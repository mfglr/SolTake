using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.ResetPassword
{
    public record ResetPasswordDto(string Email, string Token, string Password, string PasswordConfirm) : IRequest;
}
