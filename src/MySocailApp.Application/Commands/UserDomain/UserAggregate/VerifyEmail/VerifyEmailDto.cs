using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.VerifyEmail
{
    public record VerifyEmailDto(string Token) : IRequest;
}
