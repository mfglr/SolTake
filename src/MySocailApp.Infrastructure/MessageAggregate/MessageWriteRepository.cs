using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageWriteRepository(AppDbContext context) : IMessageWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
            => await _context.Messages.AddAsync(message, cancellationToken);

        public void Delete(Message message)
            => _context.Messages.Remove(message);

        public void DeleteRange(IEnumerable<Message> messages)
            => _context.Messages.RemoveRange(messages);

        public async Task<Message?> GetById(int id, CancellationToken cancellationToken)
            => await _context.Messages
                .Include(x => x.Receivers)
                .Include(x => x.Viewers)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Messages
                .Include(x => x.Receivers)
                .Include(x => x.Viewers)
                .Where(x => ids.Contains(x.Id))
                .ToListAsync(cancellationToken);

        public Task<List<Message>> GetMessagesWithRemoverByUserIds(List<int> userIds, int accountId, CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Include(x => x.Removers)
                .Where(
                    x => 
                        (x.SenderId == accountId && userIds.Any(userId => userId == x.ReceiverId)) || 
                        (x.ReceiverId == accountId && userIds.Any(userId => userId == x.SenderId))
                )
                .ToListAsync(cancellationToken);

        public Task<List<Message>> GetMessagesWithRemovers(IEnumerable<int> messageIds,CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Include(x => x.Removers)
                .Where(x => messageIds.Any(messageId => x.Id == messageId))
                .ToListAsync(cancellationToken);

        public Task<Message?> GetMesssageWithRemovers(int id, CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Include(x => x.Removers)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<List<Message>> GetUserMessages(int userId, CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Where(x => x.SenderId == userId || x.ReceiverId == userId)
                .ToListAsync(cancellationToken);
    }
}
