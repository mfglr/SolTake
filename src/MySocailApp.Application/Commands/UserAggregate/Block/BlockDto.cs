using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public record BlockDto(string BlockedId) : IRequest;
}
