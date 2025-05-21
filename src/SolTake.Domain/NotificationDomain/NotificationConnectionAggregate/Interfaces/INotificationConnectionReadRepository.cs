using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;

namespace SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces
{
    public interface INotificationConnectionReadRepository
    {
        Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
