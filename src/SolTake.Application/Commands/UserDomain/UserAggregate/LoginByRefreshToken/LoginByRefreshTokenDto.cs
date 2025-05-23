using MediatR;
using SolTake.Application.Commands.UserDomain.UserAggregate;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.LoginByRefreshToken
{
    public record LoginByRefreshTokenDto(int Id, string Token) : IRequest<LoginDto>;
}
