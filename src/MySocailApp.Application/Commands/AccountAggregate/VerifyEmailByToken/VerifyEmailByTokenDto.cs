using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmailByToken
{
    public record VerifyEmailByTokenDto(string Token) : IRequest;
}
