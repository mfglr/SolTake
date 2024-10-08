using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailVerificationToken
{
    public record UpdateEmailVerificationTokenDto() : IRequest;
}
