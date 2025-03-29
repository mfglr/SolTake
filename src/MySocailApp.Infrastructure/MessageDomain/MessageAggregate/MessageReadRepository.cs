using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistAsync(int messageId, CancellationToken cancellationToken)
            => _context.Messages.AnyAsync(x => x.Id == messageId, cancellationToken);

        public Task<Message?> GetByIdAsync(int messageId, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Include(x => x.Medias)
                .FirstOrDefaultAsync(x => x.Id == messageId);

        public Task<int> GetMessageSenderIdAsync(int messageId, CancellationToken cancellationToken)
            => _context.Messages
                .Where(x => x.Id == messageId)
                .Select(x => x.SenderId)
                .FirstOrDefaultAsync(cancellationToken);
    }
}
