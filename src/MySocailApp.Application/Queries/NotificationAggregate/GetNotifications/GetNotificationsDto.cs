using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetNotifications
{
    public class GetNotificationsDto(int? offset, int take,bool isDescending) : Pagination(offset,take,isDescending), IRequest<List<NotificationResponseDto>>;
}
