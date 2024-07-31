using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.ConversationContext.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Message>> GetByContactId(int userId1,int userId2,int? lastId,int? take,CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Receipts)
                .Include(x => x.Views)
                .Where(
                    x =>
                        (x.SenderId == userId1 && x.ReceiverId == userId2) ||
                        (x.SenderId == userId2 && x.ReceiverId == userId1)
                )
                .ToPage(lastId,take)
                .ToListAsync(cancellationToken);

        public async Task<List<Message>> GetUnviewedMessagesByReceiverId(int receiverId, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Receipts)
                .Include(x => x.Views)
                .Where(x => x.ReceiverId == receiverId && x.Views.Count == 0)
                .ToListAsync(cancellationToken);
    }
}
