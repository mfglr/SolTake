using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using System.Runtime.InteropServices;

namespace MySocailApp.Infrastructure.ConversationContext.MessageAggregate
{
    public class MessageWriteRepository(AppDbContext context) : IMessageWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
            => await _context.Messages.AddAsync(message, cancellationToken);

        public async Task<Message?> GetById(int id, CancellationToken cancellationToken)
            => await _context.Messages
                .Include(x => x.Receipts)
                .Include(x => x.Views)
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);

        public async Task<List<Message>> GetByIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Messages
                .Include(x => x.Receipts)
                .Include(x => x.Views)
                .Where(x => ids.Contains(x.Id))
                .ToListAsync(cancellationToken);
    }
}
