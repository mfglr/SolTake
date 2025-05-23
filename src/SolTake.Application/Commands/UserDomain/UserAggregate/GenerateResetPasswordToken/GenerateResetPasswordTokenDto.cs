using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken
{
    public record GenerateResetPasswordTokenDto(string Email) : IRequest;
}
