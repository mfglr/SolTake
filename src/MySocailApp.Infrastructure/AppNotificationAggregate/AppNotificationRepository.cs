using MySocailApp.Domain.AppNotificationAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppNotificationAggregate
{
    public class AppNotificationRepository(AppDbContext context) : IAppNotificationRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AppNotification notification, CancellationToken cancellationToken)
        {
            await _context.AppNotifications.AddAsync(notification,cancellationToken);
        }

        public async Task CreateListAsync(IEnumerable<AppNotification> notifications, CancellationToken cancellationToken)
        {
            await _context.AppNotifications.AddRangeAsync(notifications,cancellationToken);
        }
    }
}
