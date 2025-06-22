using Microsoft.EntityFrameworkCore;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.NotificationConnectionAggregate
{
    internal class NotificationConnectionWriteRepository(AppDbContext context) : INotificationConnectionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(NotificationConnection notificationConnection, CancellationToken cancellationToken)
            => await _context.NotificationConnections.AddAsync(notificationConnection, cancellationToken);

        public void Delete(NotificationConnection notificationConnection)
            => _context.NotificationConnections.Remove(notificationConnection);

        public async Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.NotificationConnections.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}