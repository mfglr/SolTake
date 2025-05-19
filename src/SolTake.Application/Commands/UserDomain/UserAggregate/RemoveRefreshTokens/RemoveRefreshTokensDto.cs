using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveRefreshTokens
{
    public record RemoveRefreshTokensDto(string Token) : IRequest;
}
