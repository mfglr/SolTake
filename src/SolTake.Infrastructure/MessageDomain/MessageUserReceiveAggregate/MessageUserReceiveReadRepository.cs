using Microsoft.EntityFrameworkCore;
using SolTake.Domain.MessageUserReceiveAggregate.Abstracts;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserReceiveAggregate
{
    internal class MessageUserReceiveReadRepository(AppDbContext context) : IMessageUserReceiveReadRepository
    {
        private readonly AppDbContext _context = context;
        
        public Task<bool> ExistAsync(int messageId, int userId, CancellationToken cancellationToken)
            => _context.MessageUserReceives.AnyAsync(x => x.MessageId == messageId && x.UserId == userId, cancellationToken);

        public async Task<List<int>> GetIdOfMessagesNotReceivedByUser(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken) {
            var existentMessageIds =
                await _context.MessageUserReceives
                    .Where(mur => mur.UserId == userId && messageIds.Any(messageId => mur.MessageId == messageId))
                    .Select(x => x.MessageId)
                    .ToListAsync(cancellationToken);
            return messageIds.Where(x => !existentMessageIds.Any(e => x == e)).ToList();
        }
    }
}
