using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.NotificationConnectionAggregate
{
    public class NotificationConnectionReadRepository(AppDbContext context) : INotificationConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.NotificationConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
