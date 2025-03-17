using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.UserConnectionAggregate
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
    }
}
