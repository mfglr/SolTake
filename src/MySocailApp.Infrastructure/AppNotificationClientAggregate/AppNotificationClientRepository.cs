using MySocailApp.Domain.AppNotificationClientAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppNotificationClientAggregate
{
    public class AppNotificationClientRepository(AppDbContext context) : IAppNotificationClientRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AppNotificationClient client, CancellationToken cancellationToken)
        {
            await _context.AppNotificationClients.AddAsync(client);
        }

        public async Task<AppNotificationClient?> GetByIdAsync(string id, CancellationToken cancellationToken)
        {
            return await _context.AppNotificationClients.FindAsync(id, cancellationToken);
        }
    }
}
