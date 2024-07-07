using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public record BlockDto(int BlockedId) : IRequest;
}
