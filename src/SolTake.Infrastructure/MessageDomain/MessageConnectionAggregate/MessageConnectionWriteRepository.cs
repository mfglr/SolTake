using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.MessageConnectionAggregate.Abstracts;
using SolTake.Domain.MessageConnectionAggregate.Entities;

namespace SolTake.Infrastructure.MessageDomain.UserConnectionAggregate
{
    public class MessageConnectionWriteRepository(AppDbContext context) : IMessageConnectionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(MessageConnection userConnection, CancellationToken cancellationToken)
            => await _context.MessageConnections.AddAsync(userConnection, cancellationToken);

        public void Delete(MessageConnection userConnection)
            => _context.MessageConnections.Remove(userConnection);

        public async Task<MessageConnection?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.MessageConnections.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
