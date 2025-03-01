using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.GenerateResetPasswordToken
{
    public record GenerateResetPasswordTokenDto(string Email) : IRequest;
}
