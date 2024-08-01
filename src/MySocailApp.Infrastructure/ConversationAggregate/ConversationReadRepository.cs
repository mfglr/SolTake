using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationAggregate.Entities;
using MySocailApp.Domain.ConversationAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ConversationAggregate
{
    public class ConversationReadRepository(AppDbContext context) : IConversationReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Conversation?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Conversations.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Conversation>> GetConversationsAsync(int userId, DateTime? lastDate, int? take, int? takeMessage, CancellationToken cancellationToken)
            => await _context.Conversations
                .AsNoTracking()
                .Include(x => x.Messages.OrderByDescending(x => x.Id).Take(takeMessage ?? 20))
                .Include(x => x.Users)
                .ThenInclude(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Where(x => x.Users.Any(x => x.AppUserId == userId) && (lastDate == null || x.LastMessageCreatedAt < lastDate))
                .OrderByDescending(x => x.LastMessageCreatedAt)
                .Take(take ?? 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Conversation>> GetConversationsThatHaveUnviewedMessages(int userId, CancellationToken cancellationToken)
            => await _context.Conversations
                .AsNoTracking()
                .Include(x => x.Messages.Where(x => !x.Viewers.Any(x => x.AppUserId == userId)))
                .Include(x => x.Users)
                .ThenInclude(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Messages.Any(x => !x.Viewers.Any(x => x.AppUserId == userId)))
                .Where(
                    x =>
                        x.Users.Any(x => x.AppUserId == userId) &&
                        x.Messages.Any(x => !x.Viewers.Any(x => x.AppUserId == userId))
                )
                .OrderByDescending(x => x.LastMessageCreatedAt)
                .ToListAsync(cancellationToken);

        public async Task<Conversation?> GetByUserIdsAsync(IEnumerable<int> ids, int? takeMessage, CancellationToken cancellationToken)
            => await _context.Conversations
                .AsNoTracking()
                .Include(x => x.Messages.OrderByDescending(x => x.Id).Take(takeMessage ?? 20))
                .Include(x => x.Users)
                .ThenInclude(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .FirstOrDefaultAsync(
                    conversation => ids.All(userId => conversation.Users.Any(x => x.AppUserId == userId)),
                    cancellationToken
                );
    }
}
