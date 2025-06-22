using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.UserUserConversation;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class UserUserConversationQueryRepository(AppDbContext context) : IUserUserConversationQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<UserUserConversationResponseDto>> GetAsync(int userId, IPage page, CancellationToken cancellationToken)
            => _context.UserUserConversations
                .AsNoTracking()
                .Where(x => x.ConverserId == userId)
                .ToPage(page)
                .ToUserUserConversationResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
