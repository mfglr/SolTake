using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public record UpdatePasswordDto(string CurrentPassword, string NewPassword,string NewPasswordConfirmation) : IRequest;
}
