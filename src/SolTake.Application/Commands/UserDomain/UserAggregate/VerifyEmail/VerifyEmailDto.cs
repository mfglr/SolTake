using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.VerifyEmail
{
    public record VerifyEmailDto(string Token) : IRequest;
}
