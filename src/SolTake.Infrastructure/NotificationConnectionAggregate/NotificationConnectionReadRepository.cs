using Microsoft.EntityFrameworkCore;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Entities;
using SolTake.Domain.NotificationDomain.NotificationConnectionAggregate.Interfaces;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.NotificationConnectionAggregate
{
    internal class NotificationConnectionReadRepository(AppDbContext context) : INotificationConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<NotificationConnection?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.NotificationConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
