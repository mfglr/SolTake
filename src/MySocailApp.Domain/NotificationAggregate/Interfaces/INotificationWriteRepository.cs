using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.Interfaces
{
    public interface INotificationWriteRepository
    {
        Task CreateAsync(Notification notification, CancellationToken cancellationToken);
        Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken);
        Task<List<Notification>> GetByCommentIdAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Notification>> GetBySolutionIdAsync(int solutionId, CancellationToken cancellationToken);
        void DeleteRange(IEnumerable<Notification> notifications);
    }
}
