using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.NotificationAggregate
{
    public class NotificationWriteRepository(AppDbContext context) : INotificationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Notification notification, CancellationToken cancellationToken)
            => await _context.Notifications.AddAsync(notification,cancellationToken);
        public void Delete(Notification notification)
            => _context.Notifications.Remove(notification);
        public void DeleteRange(IEnumerable<Notification> notifications)
            => _context.Notifications.RemoveRange(notifications);

        public Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);
        public Task<List<Notification>> GetBySolutionIdAsync(int solutionId, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => x.SolutionId == solutionId).ToListAsync(cancellationToken);
        public Task<List<Notification>> GetQuestionNotifications(int questionId, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => x.QuestionId == questionId).ToListAsync(cancellationToken);
        public Task<List<Notification>> GetNotificationsByUserId(int userId, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => x.UserId == userId || x.OwnerId == userId).ToListAsync(cancellationToken);

        public Task<Notification?> GetSolutionWasUpvotedNotificationAsync(int solutionId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.SolutionId == solutionId && x.OwnerId == ownerId && x.Type == NotificationType.SolutionWasUpvotedNotification, cancellationToken);
        public Task<Notification?> GetSolutionWasDownvotedNotificationAsync(int solutionId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.SolutionId == solutionId && x.OwnerId == ownerId && x.Type == NotificationType.SolutionWasDownvotedNotification, cancellationToken);
        public Task<Notification?> GetCommentLikedNotificationAsync(int commentId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.CommentId == commentId && x.OwnerId == ownerId && x.Type == NotificationType.CommentLikedNotification,cancellationToken);
        public Task<Notification?> GetQuestionLikedNotificationAsync(int questionId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.QuestionId == questionId && x.OwnerId == ownerId && x.Type == NotificationType.QuestionLikedNotification,cancellationToken);
        public Task<Notification?> GetUserFollowedNotificationAsync(int userId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.UserId == userId && x.OwnerId == ownerId && x.Type == NotificationType.UserFollowedNotification,cancellationToken);

        
    }
}
