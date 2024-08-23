using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.NotificationAggregate
{
    public class NotificationWriteRepository(AppDbContext context) : INotificationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Notification notification, CancellationToken cancellationToken)
            => await _context.Notifications.AddAsync(notification,cancellationToken);

        public void DeleteRange(IEnumerable<Notification> notifications)
            => _context.Notifications.RemoveRange(notifications);

        public async Task<List<Notification>> GetByCommentIdAsync(int commentId, CancellationToken cancellationToken)
            => await _context.Notifications.Where(x => x.CommentId == commentId || x.ParentId == commentId).ToListAsync(cancellationToken);

        public async Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken)
            => await _context.Notifications.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);

        public async Task<List<Notification>> GetBySolutionIdAsync(int solutionId, CancellationToken cancellationToken)
            => await _context.Notifications.Where(x => x.SolutionId == solutionId).ToListAsync(cancellationToken);
    }
}
