using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public record LoginByRefreshTokenDto(string Id,string Token) : IRequest<LoginResponseDto>;
}
