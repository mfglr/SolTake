using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetViewedNotifications
{
    public record GetViewedNotificationsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<NotificationResponseDto>>;
}
