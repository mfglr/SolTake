using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Domain.UserUserConversationAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.UserUserConversationAggregate
{
    internal class UserUserConversationWriteRepository(AppDbContext context) : IUserUserConversationWriteRepository
    {
        private readonly AppDbContext _context = context;

        public Task<UserUserConversation?> GetAsync(int converserId, int listenerId, CancellationToken cancellationToken)
            => _context.UserUserConversations
                .FirstOrDefaultAsync(x => x.ConverserId == converserId && x.ListenerId == listenerId, cancellationToken);

        public async Task CreateAsync(UserUserConversation userUserConversation, CancellationToken cancellationToken)
            => await _context.UserUserConversations.AddAsync(userUserConversation, cancellationToken);

        public void Delete(UserUserConversation userUserConversation)
            => _context.UserUserConversations.Remove(userUserConversation);

        public void DeleteRange(IEnumerable<UserUserConversation> conversations)
            => _context.UserUserConversations.RemoveRange(conversations);

        public Task<List<UserUserConversation>> GetListAsync(int userId0, int userId1, CancellationToken cancellationToken)
            => _context.UserUserConversations
                .Where(
                    x => 
                        (x.ConverserId == userId0 && x.ListenerId == userId1) ||
                        (x.ConverserId == userId1 && x.ListenerId == userId0)
                )
                .ToListAsync(cancellationToken);
    }
}
