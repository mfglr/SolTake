using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserUserConversation;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class UserUserConversationQueryRepository(AppDbContext context) : IUserUserConversationQueryRepository
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
