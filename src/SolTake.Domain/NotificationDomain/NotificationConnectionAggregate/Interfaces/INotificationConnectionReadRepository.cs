using MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces
{
    public interface INotificationConnectionReadRepository
    {
        Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
