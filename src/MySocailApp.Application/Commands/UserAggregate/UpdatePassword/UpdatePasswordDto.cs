using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdatePassword
{
    public record UpdatePasswordDto(string CurrentPassword, string NewPassword, string NewPasswordConfirmation) : IRequest;
}
