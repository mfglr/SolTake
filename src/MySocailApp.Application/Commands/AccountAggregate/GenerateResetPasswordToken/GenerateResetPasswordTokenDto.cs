using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.GenerateResetPasswordToken
{
    public record GenerateResetPasswordTokenDto(string Email) : IRequest;
}
