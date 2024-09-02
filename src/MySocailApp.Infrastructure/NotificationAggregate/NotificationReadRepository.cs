using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.NotificationAggregate
{
    public class NotificationReadRepository(AppDbContext context) : INotificationReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Notification>> GetViewedNotificationsByOwnerId(int ownerId, IPage pagination, CancellationToken cancellationToken)
            => await _context.Notifications
                .AsNoTracking()
                .Where(x => x.OwnerId == ownerId && x.IsViewed)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Notification>> GetUnviewedNotificationsByOwnerId(int ownerId, CancellationToken cancellationToken)
            => await _context.Notifications
                .AsNoTracking()
                .Where(x => x.OwnerId == ownerId && !x.IsViewed)
                .OrderByDescending(x => x.Id)
                .ToListAsync(cancellationToken);
    }
}
