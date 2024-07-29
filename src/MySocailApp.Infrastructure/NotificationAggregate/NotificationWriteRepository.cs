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
        public async Task<List<Notification>> GetByIds(List<int> ids, CancellationToken cancellationToken)
            => await _context.Notifications.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);
    }
}
