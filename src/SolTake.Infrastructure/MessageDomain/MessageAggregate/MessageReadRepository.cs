using Microsoft.EntityFrameworkCore;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.MessageAggregate.Abstracts;
using SolTake.Domain.MessageAggregate.Entities;

namespace SolTake.Infrastructure.MessageDomain.MessageAggregate
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

        public Task<List<int>> GetMessageIdsByUserIds(List<int> userIds, int accountId, CancellationToken cancellationToken)
            => _context.Messages
                .Include(x => x.Medias)
                .Where(
                    x =>
                        (
                            x.SenderId == accountId && userIds.Any(userId => userId == x.ReceiverId) ||
                            x.ReceiverId == accountId && userIds.Any(userId => userId == x.SenderId)
                        ) &&
                        !_context.MessageUserRemoves.Any(x => x.MessageId == x.Id && x.UserId == accountId)
                )
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);

        public Task<bool> IsNotValidToRemoveForEveryone(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken)
            =>
                _context.Messages
                    .AnyAsync(
                        m =>
                            messageIds.Any(messageId => m.Id == messageId) &&
                            m.SenderId != userId,
                        cancellationToken
                    );

        public Task<bool> IsNotValidToRemove(IEnumerable<int> messageIds, int userId, CancellationToken cancellationToken)
            =>
                _context.Messages
                    .AnyAsync(
                        m =>
                            messageIds.Any(messageId => m.Id == messageId) &&
                            m.SenderId != userId &&
                            m.ReceiverId != userId,
                        cancellationToken
                    );

        public Task<List<int>?> GetMessageUserIds(int messageId, CancellationToken cancellationToken)
            => _context.Messages
                .Where(x => x.Id == messageId)
                .Select(x => new List<int> { x.SenderId, x.ReceiverId })
                .FirstOrDefaultAsync(cancellationToken);
    }
}
