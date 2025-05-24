using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.Entities;
using SolTake.Domain.MessageConnectionAggregate.ValueObjects;

namespace SolTake.Infrastructure.MessageDomain.UserConnectionAggregate
{
    public class MessageConnectionReadRepository(AppDbContext context) : IMessageConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<MessageConnection?> GetById(int id, CancellationToken cancellationToken)
            => _context.MessageConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<List<MessageConnection>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.MessageConnections
                .AsNoTracking()
                .Where(x => ids.Any(id => x.Id == id))
                .ToListAsync(cancellationToken);

        public Task<List<string>> GetConnectionIdsByConnection(MessageConnection connection,CancellationToken cancellationToken)
            => _context.MessageConnections
                .Where(
                    x => 
                        connection.State == MessageConnectionState.Typing
                            ? x.Id == connection.UserId
                            : x.UserId == connection.Id && (x.State == MessageConnectionState.Focused || x.State == MessageConnectionState.Typing)
                )
                .Select(x => x.ConnectionId)
                .ToListAsync(cancellationToken);
    }
}
