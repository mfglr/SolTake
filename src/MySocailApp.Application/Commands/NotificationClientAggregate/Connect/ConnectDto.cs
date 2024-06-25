using MediatR;

namespace MySocailApp.Application.Commands.NotificationClientAggregate.Connect
{
    public record ConnectDto(string ConnectionId) : IRequest;
}
