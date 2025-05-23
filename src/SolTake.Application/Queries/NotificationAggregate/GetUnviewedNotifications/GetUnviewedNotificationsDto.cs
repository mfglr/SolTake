using MediatR;

namespace SolTake.Application.Queries.NotificationAggregate.GetUnviewedNotifications
{
    public record GetUnviewedNotificationsDto() : IRequest<List<NotificationResponseDto>>;
}
