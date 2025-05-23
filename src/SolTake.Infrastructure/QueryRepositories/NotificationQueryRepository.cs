using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.NotificationAggregate;
using SolTake.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class NotificationQueryRepository(AppDbContext context) : INotificationQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<NotificationResponseDto?> GetNotificationById(int id, CancellationToken cancellationToken)
            => _context.Notifications
                .AsNoTracking()
                .Where(x => x.Id == id)
                .ToNotificationResponseDto()
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<NotificationResponseDto>> GetNotificationsUnviewedByOwnerId(int ownerId, CancellationToken cancellationToken)
            => _context.Notifications
                .AsNoTracking()
                .Where(x => x.OwnerId == ownerId && !x.IsViewed)
                .OrderByDescending(x => x.Id)
                .ToNotificationResponseDto()
                .ToListAsync(cancellationToken);

        public Task<List<NotificationResponseDto>> GetNotificationsViewedByOwnerId(int ownerId, IPage page, CancellationToken cancellationToken)
            => _context.Notifications
                .AsNoTracking()
                .Where(x => x.OwnerId == ownerId && x.IsViewed)
                .ToPage(page)
                .ToNotificationResponseDto()
                .ToListAsync(cancellationToken);
    }
}
