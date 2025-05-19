using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces
{
    public interface INotificationWriteRepository
    {
        Task CreateAsync(Notification notification, CancellationToken cancellationToken);
        Task CreateRangeAsync(IEnumerable<Notification> notifications, CancellationToken cancellationToken);

        void DeleteRange(IEnumerable<Notification> notifications);
        void Delete(Notification notification);

        Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken);
        Task<List<Notification>> GetByUserId(int userId, CancellationToken cancellationToken);

        
        Task<Notification?> GetUserFollowedNotificationAsync(int userId, int ownerId, CancellationToken cancellationToken);

    }
}
