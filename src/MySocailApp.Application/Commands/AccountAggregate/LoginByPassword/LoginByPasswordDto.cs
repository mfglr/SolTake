using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public record LoginByPasswordDto(string EmailOrUserName, string Password) : IRequest<AccountDto>;
}
