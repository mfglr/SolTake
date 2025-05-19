using MediatR;

namespace MySocailApp.Application.Commands.NotificationDomain.NotificationConnectionAggregate.ConnectNotificationHub
{
    public record ConnectNotificationHubDto(string ConnectionId) : IRequest;
}
