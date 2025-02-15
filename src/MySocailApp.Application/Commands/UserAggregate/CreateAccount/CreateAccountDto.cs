using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.CreateAccount
{
    public record CreateAccountDto(string Email, string Password, string PasswordConfirm) : IRequest<AccountDto>;
}
