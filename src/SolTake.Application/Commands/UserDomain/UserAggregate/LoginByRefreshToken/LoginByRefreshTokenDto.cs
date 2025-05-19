using MediatR;
using MySocailApp.Application.Commands.UserDomain.UserAggregate;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.LoginByRefreshToken
{
    public record LoginByRefreshTokenDto(int Id, string Token) : IRequest<LoginDto>;
}
