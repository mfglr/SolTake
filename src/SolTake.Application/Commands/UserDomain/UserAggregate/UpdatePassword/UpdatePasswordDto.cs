using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdatePassword
{
    public record UpdatePasswordDto(string CurrentPassword, string NewPassword, string NewPasswordConfirmation) : IRequest;
}
