using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserUserConversationAggregate.Abstracts;
using MySocailApp.Domain.UserUserConversationAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.UserUserConversationAggregate
{
    public class UserUserConversationWriteRepository(AppDbContext context) : IUserUserConversationWriteRepository
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
    }
}
