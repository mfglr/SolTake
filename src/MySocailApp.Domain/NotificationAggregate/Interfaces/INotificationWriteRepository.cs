using MySocailApp.Domain.NotificationAggregate.Entities;

namespace MySocailApp.Domain.NotificationAggregate.Interfaces
{
    public interface INotificationWriteRepository
    {
        Task CreateAsync(Notification notification, CancellationToken cancellationToken);
        void DeleteRange(IEnumerable<Notification> notifications);
        void Delete(Notification notification);

        Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken);

        Task<Notification?> GetSolutionWasUpvotedNotificationAsync(int solutionId, int ownerId, CancellationToken cancellationToken);
        Task<Notification?> GetSolutionWasDownvotedNotificationAsync(int solutionId, int ownerId, CancellationToken cancellationToken);
        Task<Notification?> GetCommentLikedNotificationAsync(int commentId, int ownerId, CancellationToken cancellationToken);
        Task<Notification?> GetQuestionLikedNotificationAsync(int questionId, int ownerId, CancellationToken cancellationToken);
        Task<Notification?> GetUserFollowedNotificationAsync(int userId,int ownerId, CancellationToken cancellationToken);
    }
}
