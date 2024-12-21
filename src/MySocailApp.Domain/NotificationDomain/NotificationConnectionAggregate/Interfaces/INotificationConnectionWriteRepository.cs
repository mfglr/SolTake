using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces
{
    public interface INotificationConnectionWriteRepository
    {
        Task CreateAsync(NotificationConnection notificationConnection, CancellationToken cancellationToken);
        Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
        void Delete(NotificationConnection notificationConnection);
    }
}
