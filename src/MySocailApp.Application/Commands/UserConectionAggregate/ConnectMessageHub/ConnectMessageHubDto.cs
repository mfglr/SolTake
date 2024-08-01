using MediatR;

namespace MySocailApp.Application.Commands.UserConectionAggregate.ConnectMessageHub
{
    public record ConnectMessageHubDto(string ConnectionId) : IRequest;
}
