using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.Interfaces
{
    public interface INotificationReadRepository
    {
        Task<List<Notification>> GetUnviewedNotificationsByOwnerId(int ownerId, CancellationToken cancellationToken);
        Task<List<Notification>> GetNotificationsByOwnerId(int ownerId, IPage pagination, CancellationToken cancellationToken);
    }
}
