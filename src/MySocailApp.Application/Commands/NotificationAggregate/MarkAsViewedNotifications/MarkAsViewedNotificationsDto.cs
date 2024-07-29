using MediatR;

namespace MySocailApp.Application.Commands.NotificationAggregate.MarkAsViewedNotifications
{
    public record MarkAsViewedNotificationsDto(List<int> NotificationIds) : IRequest;
}
