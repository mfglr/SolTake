using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateEmailVerificationToken
{
    public record UpdateEmailVerificationTokenDto() : IRequest;
}
