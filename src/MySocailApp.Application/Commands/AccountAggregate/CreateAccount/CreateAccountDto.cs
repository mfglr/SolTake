using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public record CreateAccountDto(string Email,string Password,string PasswordConfirm) : IRequest<AccountDto>;
}
