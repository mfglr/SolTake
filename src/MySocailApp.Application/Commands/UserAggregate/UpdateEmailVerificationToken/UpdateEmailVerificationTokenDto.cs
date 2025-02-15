using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateEmailVerificationToken
{
    public record UpdateEmailVerificationTokenDto() : IRequest;
}
