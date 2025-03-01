using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateEmail
{
    public record UpdateEmailDto(string Email) : IRequest;
}
