using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.VerifyEmail
{
    public record VerifyEmailDto(string Token) : IRequest;
}
