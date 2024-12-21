using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserConnectionAggregate
{
    public class UserConnectionWriteRepository(AppDbContext context) : IMessageConnectionWriteRepository
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
