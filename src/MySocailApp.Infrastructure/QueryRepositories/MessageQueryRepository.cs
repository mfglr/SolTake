using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class MessageQueryRepository(AppDbContext context) : IMessageQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<MessageResponseDto?> GetMessageByIdAsync(int accountId, int messageId, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Where(x => x.Id == messageId)
                .ToMessageResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<MessageResponseDto>> GetMessagesByUserIdAsync(int accountId, int userId, IPage page, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Where(
                    x => 
                        (
                            (x.ReceiverId == userId && x.SenderId == accountId) || 
                            (x.SenderId == userId && x.ReceiverId == accountId)
                        ) &&
                        !x.Removers.Any(x => x.UserId == accountId)
                )
                .ToPage(page)
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
      
        public async Task<IEnumerable<MessageResponseDto>> GetConversationsAsync(int accountId, CancellationToken cancellationToken)
            => (await _context.Messages
                .AsNoTracking()
                .Where(
                    x =>
                        (x.SenderId == accountId || x.ReceiverId == accountId) &&
                        !x.Removers.Any(x => x.UserId == accountId)
                )
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken))
                .GroupBy(x => x.ConversationId)
                .OrderByDescending(x => x.OrderBy(x => x.Id).Last().Id)
                .Select(x => x.OrderBy(x => x.Id).Last());

        public Task<List<MessageResponseDto>> GetUnviewedMessagesAsync(int accountId, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Where(
                    x =>
                        x.ReceiverId == accountId && 
                        x.Viewers.Count == 0 &&
                        !x.Removers.Any(x => x.UserId == accountId)
                )
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
