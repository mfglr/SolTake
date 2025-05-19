using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Domain.MessageUserRemoveAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserRemoveAggregate
{
    public class MessageUserRemoveWriteRepository(AppDbContext context) : IMessageUserRemoveWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(MessageUserRemove messageUserRemove, CancellationToken cancellationToken)
            => await _context.MessageUserRemoves.AddAsync(messageUserRemove, cancellationToken);

        public async Task CreateRangeAsync(IEnumerable<MessageUserRemove> messageUserRemoves, CancellationToken cancellationToken)
            => await _context.MessageUserRemoves.AddRangeAsync(messageUserRemoves, cancellationToken);

        public void Delete(MessageUserRemove messageUserRemove)
            => _context.MessageUserRemoves.Remove(messageUserRemove);

        public void DeleteRange(IEnumerable<MessageUserRemove> messageUserRemoves)
            => _context.MessageUserRemoves.RemoveRange(messageUserRemoves);

        public Task<List<MessageUserRemove>> GetByMessageId(int messageId, CancellationToken cancellationToken)
            => _context.MessageUserRemoves.Where(x => x.MessageId == messageId).ToListAsync(cancellationToken);

        public Task<List<MessageUserRemove>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.MessageUserRemoves.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
