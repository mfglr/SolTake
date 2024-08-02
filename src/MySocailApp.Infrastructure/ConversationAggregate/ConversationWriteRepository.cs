using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationAggregate.Entities;
using MySocailApp.Domain.ConversationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ConversationAggregate
{
    public class ConversationWriteRepository(AppDbContext context) : IConversationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Conversation conversation, CancellationToken cancellationToken)
            => await _context.Conversations.AddAsync(conversation, cancellationToken);
        
        public async Task<Conversation?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Conversations.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        
        public async Task<Conversation?> GetByUserIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Conversations
                .FirstOrDefaultAsync(
                    conversation => conversation.Users.All(user => ids.Any(id => id == user.AppUserId)),
                    cancellationToken
                );
    }
}
