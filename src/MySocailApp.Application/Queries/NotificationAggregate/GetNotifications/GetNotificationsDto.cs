using MediatR;

namespace MySocailApp.Application.Queries.NotificationAggregate.GetNotifications
{
    public record GetNotificationsDto(int? LastId, int? Take) : IRequest<List<NotificationResponseDto>>;
}
