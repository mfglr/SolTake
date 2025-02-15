using MediatR;
using MySocailApp.Application.Commands.UserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.LoginByRefreshToken
{
    public record LoginByRefreshTokenDto(int Id, string Token) : IRequest<AccountDto>;
}
