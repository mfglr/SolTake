using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.GenerateResetPasswordToken
{
    public record GenerateResetPasswordTokenDto(string Email) : IRequest;
}
