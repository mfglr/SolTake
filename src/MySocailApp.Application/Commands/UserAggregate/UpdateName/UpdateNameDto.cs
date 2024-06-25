using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateName
{
    public record UpdateNameDto(string Name) : IRequest;
}
