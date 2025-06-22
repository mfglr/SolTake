using Microsoft.EntityFrameworkCore;
using SolTake.Domain.MessageUserViewAggregate.Abstracts;
using SolTake.Domain.MessageUserViewAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.MessageDomain.MessageUserViewAggregate
{
    internal class MessageUserViewWriteRepository(AppDbContext context) : IMessageUserViewWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateRangeAsync(IEnumerable<MessageUserView> messageUserViews, CancellationToken cancellationToken)
            => await _context.MessageUserViews.AddRangeAsync(messageUserViews,cancellationToken);

        public void DeleteRange(IEnumerable<MessageUserView> messageUserViews)
            => _context.MessageUserViews.RemoveRange(messageUserViews);

        public Task<List<MessageUserView>> GetByMessageIdAsync(int messageId, CancellationToken cancellationToken)
            => _context.MessageUserViews.Where(x => x.MessageId == messageId).ToListAsync(cancellationToken);

        public Task<List<MessageUserView>> GetByUserIdAsync(int userId, CancellationToken cancellationToken)
            => _context.MessageUserViews.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
