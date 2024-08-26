using MySocailApp.Domain.NotificationConnectionAggregate.Entities;

namespace MySocailApp.Domain.NotificationConnectionAggregate.Interfaces
{
    public interface INotificationConnectionWriteRepository
    {
        Task CreateAsync(NotificationConnection notificationConnection,CancellationToken cancellationToken);
        Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
