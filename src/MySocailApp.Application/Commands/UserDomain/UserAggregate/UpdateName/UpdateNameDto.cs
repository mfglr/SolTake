using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateName
{
    public record UpdateNameDto(string Name) : IRequest;
}
