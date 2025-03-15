using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.MessageUserRemoveAggregate
{
    public class MessageUserRemoveReadRepository(AppDbContext context) : IMessageUserRemoveReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<int>> GetUserIdsRemovedAsync(int messageId, CancellationToken cancellationToken)
            => _context.MessageUserRemoves
                .Where(x => x.MessageId == messageId)
                .Select(x => x.UserId)
                .ToListAsync(cancellationToken);

        public async Task<bool> IsDeletedAllUsersAsync(int messageId, CancellationToken cancellationToken)
            => (await GetUserIdsRemovedAsync(messageId,cancellationToken)).Count == 2;
    }
}
