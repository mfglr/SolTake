using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateEmailVerificationToken
{
    public record UpdateEmailVerificationTokenDto() : IRequest;
}
