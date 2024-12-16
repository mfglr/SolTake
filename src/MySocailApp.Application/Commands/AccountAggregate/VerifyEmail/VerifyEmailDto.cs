using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmail
{
    public record VerifyEmailDto(string Token) : IRequest;
}
