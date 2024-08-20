using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.NotificationAggregate
{
    public class NotificationReadRepository(AppDbContext context) : INotificationReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Notification>> GetNotificationsByOwnerId(int ownerId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context.Notifications
                .AsNoTracking()
                .Include(x => x.User)
                .ThenInclude(x => x.Account)
                .Include(x => x.Comment)
                .Where(x => x.OwnerId == ownerId)
                .ToPage(lastId,take)
                .ToListAsync(cancellationToken);

        public async Task<List<Notification>> GetUnviewedNotificationsByOwnerId(int ownerId, CancellationToken cancellationToken)
            => await _context.Notifications
                .AsNoTracking()
                .Include(x => x.User)
                .ThenInclude(x => x.Account)
                .Include(x => x.Comment)
                .Where(x => x.OwnerId == ownerId && !x.IsViewed)
                .OrderByDescending(x => x.Id)
                .ToListAsync(cancellationToken);
    }
}
