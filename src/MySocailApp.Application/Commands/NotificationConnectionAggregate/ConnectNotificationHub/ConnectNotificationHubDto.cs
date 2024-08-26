using MediatR;

namespace MySocailApp.Application.Commands.NotificationConnectionAggregate.ConnectNotificationHub
{
    public record ConnectNotificationHubDto(string ConnectionId) : IRequest;
}
