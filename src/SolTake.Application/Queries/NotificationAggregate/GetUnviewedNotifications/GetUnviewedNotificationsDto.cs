using MediatR;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetUnviewedNotifications
{
    public record GetUnviewedNotificationsDto() : IRequest<List<NotificationResponseDto>>;
}
