using MediatR;

namespace SolTake.Application.Commands.NotificationDomain.NotificationAggregate.MarkAsViewedNotifications
{
    public record MarkAsViewedNotificationsDto(List<int> Ids) : IRequest;
}
