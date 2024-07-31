using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationContext.ConversationAggregate.Entities;
using MySocailApp.Domain.ConversationContext.ConversationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ConversationContext.ConversationAggregate
{
    public class ConversationWriteRepository(AppDbContext context) : IConversationWriteRepository
    {
        private readonly AppDbContext _context = context;
        
        public async Task CreateAsync(Conversation conversation, CancellationToken cancellationToken)
            => await _context.Conversations.AddAsync(conversation,cancellationToken);

        public async Task<Conversation?> GetByIdAsync(int userId1, int userId2, CancellationToken cancellationToken)
        {
            var id = Conversation.GetId(userId1, userId2);
            return await _context.Conversations.FirstOrDefaultAsync(x => x.UserId1 == id[0] && x.UserId2 == id[1], cancellationToken);
        }
    }
}
