using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.NotificationAggregate
{
    public class NotificationWriteRepository(AppDbContext context) : INotificationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Notification notification, CancellationToken cancellationToken)
            => await _context.Notifications.AddAsync(notification, cancellationToken);
        public async Task CreateRangeAsync(IEnumerable<Notification> notifications, CancellationToken cancellationToken)
            => await _context.Notifications.AddRangeAsync(notifications, cancellationToken);
        public void Delete(Notification notification)
            => _context.Notifications.Remove(notification);
        public void DeleteRange(IEnumerable<Notification> notifications)
            => _context.Notifications.RemoveRange(notifications);

        public Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);

        public Task<List<Notification>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.Notifications.Where(x => x.UserId == userId).ToListAsync(cancellationToken);

        public Task<Notification?> GetUserFollowedNotificationAsync(int userId, int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .FirstOrDefaultAsync(x => x.UserId == userId && x.OwnerId == ownerId && x.Type == NotificationType.UserFollowedNotification,cancellationToken);

        
    }
}
