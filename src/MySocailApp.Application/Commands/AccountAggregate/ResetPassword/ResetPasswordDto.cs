using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.ResetPassword
{
    public record ResetPasswordDto(string Email,string Token,string Password,string PasswordConfirm) : IRequest;
}
