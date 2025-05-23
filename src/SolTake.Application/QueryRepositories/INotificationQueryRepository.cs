using SolTake.Application.Queries.NotificationAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface INotificationQueryRepository
    {
        Task<NotificationResponseDto?> GetNotificationById(int id, CancellationToken cancellationToken);
        Task<List<NotificationResponseDto>> GetNotificationsViewedByOwnerId(int ownerId, IPage page, CancellationToken cancellationToken);
        Task<List<NotificationResponseDto>> GetNotificationsUnviewedByOwnerId(int ownerId,CancellationToken cancellationToken);
    }
}
