using MediatR;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetNotifications
{
    public record GetNotificationsDto(int? LastValue, int? Take) : IRequest<List<NotificationResponseDto>>;
}
