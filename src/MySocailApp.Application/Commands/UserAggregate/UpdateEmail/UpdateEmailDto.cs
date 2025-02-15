using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateEmail
{
    public record UpdateEmailDto(string Email) : IRequest;
}
