using Microsoft.EntityFrameworkCore;
using SolTake.Domain.MessageUserViewAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserViewAggregate
{
    internal class MessageUserViewReadRepository(AppDbContext context) : IMessageUserViewReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<int>> GetIdOfMessagesNotViewedByUser(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken)
        {
            var existentMessageIds =
                await _context.MessageUserViews
                    .Where(mur => mur.UserId == userId && messageIds.Any(messageId => mur.MessageId == messageId))
                    .Select(x => x.MessageId)
                    .ToListAsync(cancellationToken);
            return messageIds.Where(x => !existentMessageIds.Any(e => x == e)).ToList();
        }
    }
}
