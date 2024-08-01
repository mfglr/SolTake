using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.MessageAggregate
{
    public class MessageReadRepository(AppDbContext context) : IMessageReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Message>> GetByConversationId(int conversationId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Conversation)
                .Include(x => x.Receivers)
                .Include(x => x.Viewers)
                .Where(x => x.ConversationId == conversationId)
                .ToPage(lastId, take)
                .ToListAsync(cancellationToken);

        public async Task<List<Message>> GetUnviewedMessagesByConversationId(int conversationId, CancellationToken cancellationToken)
            => await _context.Messages
                .AsNoTracking()
                .Include(x => x.Conversation)
                .Include(x => x.Receivers)
                .Include(x => x.Viewers)
                .Where(x => x.ConversationId == conversationId && x.Viewers.Count == 0)
                .ToListAsync(cancellationToken);
    }
}
