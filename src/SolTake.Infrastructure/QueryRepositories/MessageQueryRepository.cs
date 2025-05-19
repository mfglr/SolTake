using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

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
                        !_context.MessageUserRemoves.Any(mur => mur.MessageId == x.Id && mur.UserId == accountId)
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
                        !_context.MessageUserRemoves.Any(mur => mur.MessageId == x.Id && mur.UserId == accountId)
                )
                .ToMessageResponseDto(_context, accountId)
                .ToListAsync(cancellationToken))
                .GroupBy(x => x.ConversationId)
                .OrderByDescending(x => x.OrderBy(x => x.Id).Last().Id)
                .Select(x => x.OrderBy(x => x.Id).Last());

        public Task<List<MessageResponseDto>> GetUnviewedMessagesAsync(int userId, CancellationToken cancellationToken)
            => _context.Messages
                .AsNoTracking()
                .Where(
                    x =>
                        x.ReceiverId == userId &&
                        _context.MessageUserViews.Count(muv => muv.MessageId == x.Id) == 0 &&
                        !_context.MessageUserRemoves.Any(mur => mur.MessageId == x.Id && mur.UserId == userId)
                )
                .ToMessageResponseDto(_context, userId)
                .ToListAsync(cancellationToken);
    }
}
