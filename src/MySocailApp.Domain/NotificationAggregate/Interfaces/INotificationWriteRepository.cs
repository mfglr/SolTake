using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;

namespace MySocailApp.Domain.NotificationAggregate.Interfaces
{
    public interface INotificationWriteRepository
    {
        Task CreateAsync(Notification notification, CancellationToken cancellationToken);
        Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken);
        Task<List<Notification>> GetByCommentIdAsync(int commentId, CancellationToken cancellationToken);
        Task<List<Notification>> GetBySolutionIdAsync(int solutionId, CancellationToken cancellationToken);
        Task<Notification?> GetCommentLikedNotificationAsync(int commentId, int ownerId, CancellationToken cancellationToken);
        Task<Notification?> GetQuestionLikedNotificationAsync(int questionId, int ownerId, CancellationToken cancellationToken);
        void DeleteRange(IEnumerable<Notification> notifications);
        void Delete(Notification notification);
    }
}
