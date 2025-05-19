using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces
{
    public interface INotificationReadRepository
    {
        Task<List<Notification>> GetViewedNotificationsByOwnerId(int ownerId, IPage pagination, CancellationToken cancellationToken);
        Task<List<Notification>> GetUnviewedNotificationsByOwnerId(int ownerId, CancellationToken cancellationToken);
    }
}
