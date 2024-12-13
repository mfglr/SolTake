using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.ResetPassword
{
    public record ResetPasswordDto(string Token, string Email, string Password, string PasswordConfirm) : IRequest;
}
