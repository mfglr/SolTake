using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
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
                        !x.Removers.Any(x => x.AppUserId == accountId)
                )
                .ToPage(page)
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<List<MessageResponseDto>> GetConversationsAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => _context.MessageResponseDtos
                .FromSqlInterpolated($"exec sp_get_conversations {accountId},{page.Offset},{page.Take}")
                .ToListAsync(cancellationToken);

        public Task<List<MessageResponseDto>> GetUnviewedMessagesAsync(int accountId, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Where(
                    x => 
                        x.ReceiverId == accountId && 
                        x.Viewers.Count == 0 &&
                        !x.Removers.Any(x => x.AppUserId == accountId)
                )
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
