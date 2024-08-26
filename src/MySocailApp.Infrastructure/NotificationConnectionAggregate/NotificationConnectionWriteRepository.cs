using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.NotificationConnectionAggregate.Entities;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.NotificationConnectionAggregate
{
    public class NotificationConnectionWriteRepository(AppDbContext context) : INotificationConnectionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(NotificationConnection notificationConnection, CancellationToken cancellationToken)
            => await _context.NotificationConnections.AddAsync(notificationConnection, cancellationToken);

        public async Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.NotificationConnections.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}