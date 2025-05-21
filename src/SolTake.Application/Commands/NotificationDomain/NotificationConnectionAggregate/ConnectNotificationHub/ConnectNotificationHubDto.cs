using MediatR;

namespace SolTake.Application.Commands.NotificationDomain.NotificationConnectionAggregate.ConnectNotificationHub
{
    public record ConnectNotificationHubDto(string ConnectionId) : IRequest;
}
