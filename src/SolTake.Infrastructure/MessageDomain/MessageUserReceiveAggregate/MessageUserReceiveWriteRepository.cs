using Microsoft.EntityFrameworkCore;
using SolTake.Domain.MessageUserReceiveAggregate.Abstracts;
using SolTake.Domain.MessageUserReceiveAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserReceiveAggregate
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
