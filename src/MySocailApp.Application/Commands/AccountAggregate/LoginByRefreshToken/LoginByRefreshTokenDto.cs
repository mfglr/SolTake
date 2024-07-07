using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public record LoginByRefreshTokenDto(int Id,string Token) : IRequest<AccountDto>;
}
