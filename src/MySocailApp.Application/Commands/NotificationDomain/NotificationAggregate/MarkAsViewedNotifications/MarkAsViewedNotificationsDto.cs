using MediatR;

namespace MySocailApp.Application.Commands.NotificationDomain.NotificationAggregate.MarkAsViewedNotifications
{
    public record MarkAsViewedNotificationsDto(List<int> Ids) : IRequest;
}
