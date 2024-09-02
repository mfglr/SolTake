using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetViewedNotifications
{
    public class GetViewedNotificationsDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<NotificationResponseDto>>;
}
