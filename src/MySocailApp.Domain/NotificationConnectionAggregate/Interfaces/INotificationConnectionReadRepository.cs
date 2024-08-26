using MySocailApp.Domain.NotificationConnectionAggregate.Entities;

namespace MySocailApp.Domain.NotificationConnectionAggregate.Interfaces
{
    public interface INotificationConnectionReadRepository
    {
        Task<NotificationConnection?> GetByIdAsync(int id,CancellationToken cancellationToken);
    }
}
