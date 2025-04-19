using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageUserReceiveAggregate.Abstracts;
using MySocailApp.Domain.MessageUserReceiveAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserReceiveAggregate
{
    public class MessageUserReceiveWriteRepository(AppDbContext context) : IMessageUserReceiveWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(MessageUserReceive messageUserReceive, CancellationToken cancellationToken)
            => await _context.MessageUserReceives.AddAsync(messageUserReceive, cancellationToken);

        public async Task CreateRangeAsync(IEnumerable<MessageUserReceive> messageUserRecives, CancellationToken cancellationToken)
            => await _context.MessageUserReceives.AddRangeAsync(messageUserRecives, cancellationToken);

        public void Delete(MessageUserReceive messageUserReceive)
            => _context.MessageUserReceives.Remove(messageUserReceive);

        public void DeleteRange(IEnumerable<MessageUserReceive> messageUserReceives)
            => _context.MessageUserReceives.RemoveRange(messageUserReceives);

        public Task<List<MessageUserReceive>> GetByMessageIdAsync(int messageId, CancellationToken cancellationToken)
            => _context.MessageUserReceives.Where(x => x.MessageId == messageId).ToListAsync(cancellationToken);

        public Task<List<MessageUserReceive>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.MessageUserReceives.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
