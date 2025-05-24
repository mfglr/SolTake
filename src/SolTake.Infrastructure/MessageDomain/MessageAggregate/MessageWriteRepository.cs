using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.MessageAggregate.Abstracts;
using SolTake.Domain.MessageAggregate.Entities;

namespace SolTake.Infrastructure.MessageDomain.MessageAggregate
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
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Messages
                .Where(x => ids.Contains(x.Id))
                .ToListAsync(cancellationToken);

        public Task<List<Message>> GetUserMessages(int userId, CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Where(x => x.SenderId == userId || x.ReceiverId == userId)
                .ToListAsync(cancellationToken);
    }
}
