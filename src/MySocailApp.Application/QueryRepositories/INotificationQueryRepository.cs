using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface INotificationQueryRepository
    {
        Task<NotificationResponseDto?> GetNotificationById(int id, CancellationToken cancellationToken);
        Task<List<NotificationResponseDto>> GetNotificationsViewedByOwnerId(int ownerId, IPage page, CancellationToken cancellationToken);
        Task<List<NotificationResponseDto>> GetNotificationsUnviewedByOwnerId(int ownerId,CancellationToken cancellationToken);
    }
}
