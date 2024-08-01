using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageWriteRepository(AppDbContext context) : IMessageWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Message message, CancellationToken cancellationToken)
            => await _context.Messages.AddAsync(message, cancellationToken);

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
    }
}
