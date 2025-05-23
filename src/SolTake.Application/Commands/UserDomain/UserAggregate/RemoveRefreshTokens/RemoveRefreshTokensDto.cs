using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.RemoveRefreshTokens
{
    public record RemoveRefreshTokensDto(string Token) : IRequest;
}
